update employees set salary = salary * 1.10;

update employees 
set status = 'Senior'
where salary > 60000 and hire_date < date '2020-01-01';

update employees 
set department = case
    when salary > 80000 then 'Management'
    when salary between 50000 and 80000 then 'Senior'
    else 'Junior'
end;

update employees
set department = DEFAULT
where status = 'Inactive';

update departments d 
set budget = (
    select round(avg(e.salary) * 1.20)
    from employees e
    where e.department = d.dept_name
)
where exists (
    select 1 from employees e where e.department = d.dept_name);

update employees 
set salary = salary * 1.15,
    status = 'Promoted'
where department = 'Sales';