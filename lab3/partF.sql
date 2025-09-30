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

