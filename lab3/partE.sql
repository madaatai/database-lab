insert into employees (first_name, last_name, salary, department)
values ('Ivan', 'Nullov', null, null);

update employees
set department = 'Unassigned'
where department is null;

delete from employees
where salary is null or department is null;

