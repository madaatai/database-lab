insert into employees (first_name, last_name, department, salary)
select 'Oleg', 'Ivanov', 'Finance', 55000
where not exists (
    select 1 from employees
    where first_name = 'Oleg' and last_name = 'Ivanov'
);

update employees e
set salary = case
    when (select budget from departments d where d.dept_name = e.department) > 100000
        then salary * 1.10
    else salary * 1.05
end;

with inserted as (
    insert into employees (first_name, last_name, department, salary, hire_date)
    values 
      ('Milana', 'One', 'Support', 35000, CURRENT_DATE), 
      ('Diana', 'Two', 'Support', 36000, CURRENT_DATE),
      ('Karen', 'Three', 'Support', 37000, CURRENT_DATE),
      ('Leila', 'Four', 'Support', 38000, CURRENT_DATE),
      ('Asyl', 'Five', 'Support', 39000, CURRENT_DATE)
    RETURNING emp_id
)

update employees 
set salary = salary * 1.10
where emp_id in (select emp_id from inserted);

create table if not exists employee_archive (like employees including all);
insert into employee_archive
select * from employees where status = 'Inactive';
delete * from employees where status = 'Inactive';

update projects p
set end_date = end_date + interval '30 days'
where p.budget > 50000
    and (
        select count(*)
        from employees e
        join departments d on e.department = d.dept_name
        where d.dept_id = p.dept_id
    ) > 3;