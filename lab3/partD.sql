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
