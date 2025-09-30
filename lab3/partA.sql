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