--part A

create database advanced_lab;

CREATE TABLE employees (
    emp_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,    
    last_name VARCHAR(50) NOT NULL,     
    department VARCHAR(100),            
    salary INTEGER,                     
    hire_date DATE,                     
    status VARCHAR(20) DEFAULT 'Active'
);
create table departments(
    dept_id serial primary key,
    dept_name varchar(100) not null,
    budget INTEGER,
    manager_id INTEGER
);

create table projects(
    projects_id serial primary key,
    projects_name varchar(150) not null,
    dept_id INTEGER,
    start_datae date,
    end_date date,
    budget INTEGER
);

--part B
insert into employees (emp_id, first_name, last_name, department)
values (1001, 'Alice', 'Johnson', 'IT');

insert into employees (first_name, last_name, department)
values ('Bob', 'Petrov', 'Sales');

insert into departments (dept_name, budget)
values ('Marketing', 6000), ('Finance', 120000), ('HR', 50000);

insert into employees (first_name, last_name, department, salary, hire_date)
values ('Dina', 'Kazak', 'IT', (50000 * 1.1)::INT, current_data)

create temp table temp_emplyees as
select * from employees where department = 'IT';


--part C
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

--part D
delete from employees
where status = 'Terminated';

delete from employees
where salary < 40000 and hire_date > date '2023-01-01' and department in null;

delete from departments
where dept_name not in (
    select distinct department
    from employees
    where department in not null
);

delete from projects 
where end_date < date '2023-01-01'
RETURNING *;


--part E
insert into employees (first_name, last_name, salary, department)
values ('Ivan', 'Nullov', null, null);

update employees
set department = 'Unassigned'
where department is null;

delete from employees
where salary is null or department is null;

--part F
insert into employees (first_name, last_name, department, salary)
values ('Anna', 'Sidorovna', 'Marketing', 45000)
RETURNING emp_id, (first_name || ' ' || last_name) as full_name;

update employees 
set salary = salary + 5000
where department = 'IT'
RETURNING emp_id, (salary - 5000) as old_salary, salary as new_salary;

delete from employees
where hire_date < date '2020-01-01'
RETURNING *;

--part G
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