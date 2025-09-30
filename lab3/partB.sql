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
