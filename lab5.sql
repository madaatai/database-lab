--task 1.1
create table employees (
    employee_id int,
    first_name text,
    last_name text,
    age int check(age between 18 and 65),
    salary numeric check (salary > 0)
)

insert into employees values (1, 'John', 'Doe', 25, 3000);
insert into employees values (2, 'Arina', 'Lee', 19, 25000);
insert into employees values (3, 'Merey', 'Kim', 60, 10500);
insert into employees values (4, 'Alen', 'Satpayev', 17, 2000);
insert into employees values (5, 'Nastya', 'Main', 40, 0);

--task 1.2
create table products_catalog (
    product_id int,
    product_name text,
    regular_price numeric,
    discount_price numeric,
    contraint valid_discount check(
        regular_price > 0
        and discount_price > 0
        and discount_price < regular_price
    )
);

--task 1.3
create table bookings (
    booking_id int,
    check_in_date date,
    check_out_date date,
    num_guests int check(num_guests between 1 and 10),
    check (check_out_date > check_in_date)
);

insert into bookings values (1, '2025-10-10', '2025-10-15', 2);
insert into bookings values (2, '2025-11-01', '2025-11-05', 4);
insert into bookings values (3, '2025-12-01', '2025-12-05', 15);
insert into bookings values (4, '2025-10-20', '2025-10-18', 3);

--task 2.1
create table customers(
    customer_id int not null,
    email text not null,
    phone text,
    registration_date date not null
);

INSERT INTO customers VALUES (1, 'john@example.com', '123456789', '2025-10-10');
INSERT INTO customers VALUES (2, 'anna@example.com', NULL, '2025-10-11');
INSERT INTO customers VALUES (3, NULL, '987654321', '2025-10-12');
INSERT INTO customers VALUES (4, 'mike@example.com', '555555555', NULL);

--task 2.2
create table inventory(
    item_id int not null,
    item_name text not null,
    quantity int not null check(quantity >= 0),
    unit_price numeric not null check(unit_price > 0),
    last_updated timestamp not null
);

--task 2.3
INSERT INTO inventory VALUES (1, 'Laptop', 10, 1200, '2025-10-14 10:00:00');
INSERT INTO inventory VALUES (2, 'Phone', 20, 800, '2025-10-14 11:00:00');
INSERT INTO inventory VALUES (3, NULL, 15, 500, '2025-10-14 12:00:00');
INSERT INTO inventory VALUES (4, 'Mouse', NULL, 25, '2025-10-14 13:00:00');
INSERT INTO inventory VALUES (5, 'Keyboard', 30, -100, '2025-10-14 14:00:00');
INSERT INTO inventory VALUES (6, 'Monitor', 5, 700, NULL);

--task 3.1
create table users (
    user_id int,
    username text unique,
    email text unique,
    created_at timestamp
);

INSERT INTO users VALUES (1, 'john_doe', 'john@example.com', '2025-10-14 10:00:00');
INSERT INTO users VALUES (2, 'anna_smith', 'anna@example.com', '2025-10-14 11:00:00');
INSERT INTO users VALUES (3, 'john_doe', 'john2@example.com', '2025-10-14 12:00:00');
INSERT INTO users VALUES (4, 'kate', 'anna@example.com', '2025-10-14 13:00:00');

-- task 3.2
CREATE TABLE course_enrollments (
    enrollment_id INTEGER,
    student_id INTEGER,
    course_code TEXT,
    semester TEXT,
    UNIQUE (student_id, course_code, semester)
);

INSERT INTO course_enrollments VALUES (1, 101, 'CS101', 'Fall2025');
INSERT INTO course_enrollments VALUES (2, 101, 'CS102', 'Fall2025');
INSERT INTO course_enrollments VALUES (3, 101, 'CS101', 'Fall2025');
INSERT INTO course_enrollments VALUES (4, 102, 'CS101', 'Spring2026');

-- task 3.3
DROP TABLE users;

CREATE TABLE users (
    user_id INTEGER,
    username TEXT,
    email TEXT,
    created_at TIMESTAMP,
    CONSTRAINT unique_username UNIQUE (username),
    CONSTRAINT unique_email UNIQUE (email)
);

INSERT INTO users VALUES (1, 'john_doe', 'john@example.com', '2025-10-14 10:00:00');
INSERT INTO users VALUES (2, 'anna_smith', 'anna@example.com', '2025-10-14 11:00:00');
INSERT INTO users VALUES (3, 'john_doe', 'john2@example.com', '2025-10-14 12:00:00');
INSERT INTO users VALUES (4, 'kate', 'anna@example.com', '2025-10-14 13:00:00');

-- Task 4.1
CREATE TABLE departments (
    dept_id INTEGER PRIMARY KEY,
    dept_name TEXT NOT NULL,
    location TEXT
);

INSERT INTO departments VALUES (1, 'HR', 'Building A');
INSERT INTO departments VALUES (2, 'Finance', 'Building B');
INSERT INTO departments VALUES (3, 'IT', 'Building C');
INSERT INTO departments VALUES (1, 'Marketing', 'Building D');
INSERT INTO departments VALUES (NULL, 'Legal', 'Building E');

-- Task 4.2
create table student_courses (
    student_id INTEGER,
    course_id INTEGER,
    enrollment_date DATE,
    grade TEXT,
    PRIMARY KEY (student_id, course_id)
);

INSERT INTO student_courses VALUES (101, 501, '2025-09-01', 'A');
INSERT INTO student_courses VALUES (102, 502, '2025-09-01', 'B');
INSERT INTO student_courses VALUES (101, 501, '2025-09-02', 'C');
INSERT INTO student_courses VALUES (103, 503, '2025-09-03', 'A');

-- Task 4.3
-- 1. PRIMARY KEY vs UNIQUE:
--    PRIMARY KEY uniquely identifies each record and cannot be NULL.
--    UNIQUE also ensures uniqueness but allows one NULL (depending on DBMS).
--
-- 2. Single-column PRIMARY KEY is used when one field uniquely identifies a row.
--    Composite PRIMARY KEY is used when a combination of fields uniquely identifies a row.
--
-- 3. A table can have only one PRIMARY KEY because it defines the main unique identifier,
--    but multiple UNIQUE constraints can exist to enforce uniqueness on other columns.

--task 5.1
CREATE TABLE employees_dept (
    emp_id INTEGER PRIMARY KEY,
    emp_name TEXT NOT NULL,
    dept_id INTEGER REFERENCES departments(dept_id),
    hire_date DATE
);

INSERT INTO employees_dept VALUES (1, 'John Doe', 1, '2025-01-10');
INSERT INTO employees_dept VALUES (2, 'Anna Smith', 2, '2025-02-15');
INSERT INTO employees_dept VALUES (3, 'Mike Brown', 5, '2025-03-20');

-- Task 5.2
CREATE TABLE authors (
    author_id INTEGER PRIMARY KEY,
    author_name TEXT NOT NULL,
    country TEXT
);

CREATE TABLE publishers (
    publisher_id INTEGER PRIMARY KEY,
    publisher_name TEXT NOT NULL,
    city TEXT
);

CREATE TABLE books (
    book_id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    author_id INTEGER REFERENCES authors(author_id),
    publisher_id INTEGER REFERENCES publishers(publisher_id),
    publication_year INTEGER,
    isbn TEXT UNIQUE
);

INSERT INTO authors VALUES (1, 'George Orwell', 'UK');
INSERT INTO authors VALUES (2, 'Leo Tolstoy', 'Russia');
INSERT INTO authors VALUES (3, 'Mark Twain', 'USA');

INSERT INTO publishers VALUES (1, 'Penguin Books', 'London');
INSERT INTO publishers VALUES (2, 'Vintage', 'New York');
INSERT INTO publishers VALUES (3, 'AST', 'Moscow');

INSERT INTO books VALUES (1, '1984', 1, 1, 1949, '9780451524935');
INSERT INTO books VALUES (2, 'War and Peace', 2, 3, 1869, '9780199232765');
INSERT INTO books VALUES (3, 'Adventures of Huckleberry Finn', 3, 2, 1884, '9780142437179');
INSERT INTO books VALUES (4, 'Unknown Book', 5, 1, 2020, '9789999999999');

-- Task 5.3
CREATE TABLE categories (
    category_id INTEGER PRIMARY KEY,
    category_name TEXT NOT NULL
);

CREATE TABLE products_fk (
    product_id INTEGER PRIMARY KEY,
    product_name TEXT NOT NULL,
    category_id INTEGER REFERENCES categories(category_id) ON DELETE RESTRICT
);

CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    order_date DATE NOT NULL
);

CREATE TABLE order_items (
    item_id INTEGER PRIMARY KEY,
    order_id INTEGER REFERENCES orders(order_id) ON DELETE CASCADE,
    product_id INTEGER REFERENCES products_fk(product_id),
    quantity INTEGER CHECK (quantity > 0)
);

INSERT INTO categories VALUES (1, 'Electronics');
INSERT INTO categories VALUES (2, 'Furniture');

INSERT INTO products_fk VALUES (1, 'Laptop', 1);
INSERT INTO products_fk VALUES (2, 'Chair', 2);

INSERT INTO orders VALUES (1, '2025-10-14');
INSERT INTO orders VALUES (2, '2025-10-15');

INSERT INTO order_items VALUES (1, 1, 1, 2);
INSERT INTO order_items VALUES (2, 2, 2, 1);

-- Try to delete category with existing products (RESTRICT)
DELETE FROM categories WHERE category_id = 1;

-- Delete order and observe CASCADE delete of order_items
DELETE FROM orders WHERE order_id = 1;

-- 1. Deleting a category with products fails due to ON DELETE RESTRICT.
-- 2. Deleting an order automatically deletes related order_items due to ON DELETE CASCADE.
-- 3. RESTRICT prevents deletion if referenced; CASCADE removes dependent rows automatically.

-- Task 6.1: E-commerce Database Design

-- Table 1: customers
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    phone TEXT,
    registration_date DATE NOT NULL
);

-- Table 2: products
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT,
    price NUMERIC NOT NULL CHECK (price >= 0),
    stock_quantity INTEGER NOT NULL CHECK (stock_quantity >= 0)
);

-- Table 3: orders
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(customer_id) ON DELETE CASCADE,
    order_date DATE NOT NULL,
    total_amount NUMERIC NOT NULL CHECK (total_amount >= 0),
    status TEXT NOT NULL CHECK (status IN ('pending', 'processing', 'shipped', 'delivered', 'cancelled'))
);

-- Table 4: order_details
CREATE TABLE order_details (
    order_detail_id SERIAL PRIMARY KEY,
    order_id INTEGER REFERENCES orders(order_id) ON DELETE CASCADE,
    product_id INTEGER REFERENCES products(product_id) ON DELETE RESTRICT,
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    unit_price NUMERIC NOT NULL CHECK (unit_price >= 0)
);

-- Sample Data: customers
INSERT INTO customers (name, email, phone, registration_date) VALUES
('John Doe', 'john@example.com', '111111111', '2025-01-01'),
('Anna Smith', 'anna@example.com', '222222222', '2025-02-01'),
('Mike Brown', 'mike@example.com', '333333333', '2025-03-01'),
('Kate Johnson', 'kate@example.com', '444444444', '2025-04-01'),
('Tom Lee', 'tom@example.com', '555555555', '2025-05-01');

-- Sample Data: products
INSERT INTO products (name, description, price, stock_quantity) VALUES
('Laptop', 'Gaming laptop', 1200, 10),
('Phone', 'Smartphone with 5G', 800, 20),
('Headphones', 'Noise cancelling', 150, 30),
('Monitor', '4K Display', 300, 15),
('Keyboard', 'Mechanical keyboard', 100, 25);

-- Sample Data: orders
INSERT INTO orders (customer_id, order_date, total_amount, status) VALUES
(1, '2025-06-01', 2000, 'pending'),
(2, '2025-06-05', 800, 'processing'),
(3, '2025-06-10', 450, 'shipped'),
(4, '2025-06-15', 300, 'delivered'),
(5, '2025-06-20', 100, 'cancelled');

-- Sample Data: order_details
INSERT INTO order_details (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 1200),
(1, 2, 1, 800),
(2, 2, 1, 800),
(3, 3, 3, 150),
(4, 4, 1, 300),
(5, 5, 1, 100);

-- Testing Constraints

-- 1. Duplicate email (should fail - UNIQUE constraint)
INSERT INTO customers (name, email, phone, registration_date)
VALUES ('Duplicate', 'john@example.com', '666666666', '2025-07-01');

-- 2. Negative product price (should fail - CHECK constraint)
INSERT INTO products (name, description, price, stock_quantity)
VALUES ('Invalid Product', 'Negative price', -10, 5);

-- 3. Invalid order status (should fail - CHECK constraint)
INSERT INTO orders (customer_id, order_date, total_amount, status)
VALUES (1, '2025-07-01', 100, 'unknown');

-- 4. Quantity <= 0 in order_details (should fail - CHECK constraint)
INSERT INTO order_details (order_id, product_id, quantity, unit_price)
VALUES (1, 1, 0, 1200);

-- 5. Delete order (should cascade delete order_details)
DELETE FROM orders WHERE order_id = 1;

-- 6. Delete product with existing order_details (should fail - RESTRICT)
DELETE FROM products WHERE product_id = 2;




-- Madina Ataibekova
-- id: 24B030283
-- database constraints - lab work


-- task 1.1: базовый check
create table employees (
    employee_id int,
    first_name text,
    last_name text,
    age int check (age between 18 and 65),    -- возраст от 18 до 65
    salary numeric check (salary > 0)         -- зарплата больше 0
);

insert into employees values
(1, 'john', 'doe', 30, 2000),
(2, 'anna', 'smith', 50, 3500);


-- ошибка: возраст вне диапазона
-- insert into employees values (3, 'tom', 'lee', 70, 2000); -> ошибка check(age between 18 and 65)

-- ошибка: зарплата отрицательная
-- insert into employees values (4, 'kate', 'brown', 25, -100); -> ошибка check(salary > 0)


-- task 1.2:
create table products_catalog (
    product_id int,
    product_name text,
    regular_price numeric,
    discount_price numeric,
    constraint valid_discount check (
        regular_price > 0 and discount_price > 0 and discount_price < regular_price
    )
);

insert into products_catalog values
(1, 'laptop', 1000, 800),
(2, 'phone', 900, 700);

-- ошибка: скидка выше обычной цены
-- insert into products_catalog values (3, 'tablet', 1000, 1200); -> ошибка valid_discount


-- task 1.3:
create table bookings (
    booking_id int,
    check_in_date date,
    check_out_date date,
    num_guests int check (num_guests between 1 and 10),
    check (check_out_date > check_in_date)
);

insert into bookings values
(1, '2025-01-01', '2025-01-05', 3),
(2, '2025-02-10', '2025-02-15', 2);

-- ошибка: дата выезда раньше заезда
-- insert into bookings values (3, '2025-03-10', '2025-03-05', 2); -> ошибка check(check_out_date > check_in_date)

-- ошибка: гостей 0
-- insert into bookings values (4, '2025-03-01', '2025-03-05', 0); -> ошибка check(num_guests between 1 and 10)


-- task 2.1:
create table customers (
    customer_id int not null,
    email text not null,
    phone text,
    registration_date date not null
);

insert into customers values
(1, 'a@mail.com', '111', '2025-01-01'),
(2, 'b@mail.com', null, '2025-02-01');

-- ошибка: пропущен email
-- insert into customers values (3, null, '222', '2025-03-01'); -> ошибка not null


-- task 2.2:
create table inventory (
    item_id int not null,
    item_name text not null,
    quantity int not null check (quantity >= 0),
    unit_price numeric not null check (unit_price > 0),
    last_updated timestamp not null
);

insert into inventory values
(1, 'pen', 100, 2, now()),
(2, 'book', 50, 10, now());

-- ошибка: отрицательное количество
-- insert into inventory values (3, 'eraser', -5, 2, now()); -> ошибка check(quantity >= 0)


-- task 3.1: 
create table users (
    user_id int,
    username text unique,
    email text unique,
    created_at timestamp
);

insert into users values
(1, 'john', 'john@mail.com', now()),
(2, 'anna', 'anna@mail.com', now());

-- ошибка: повторный username
-- insert into users values (3, 'john', 'john2@mail.com', now()); -> ошибка unique(username)


-- task 3.2:
create table course_enrollments (
    enrollment_id int,
    student_id int,
    course_code text,
    semester text,
    unique (student_id, course_code, semester)
);

insert into course_enrollments values
(1, 101, 'CS101', 'fall'),
(2, 102, 'CS101', 'fall');

-- ошибка: дубликат комбинации
-- insert into course_enrollments values (3, 101, 'CS101', 'fall'); -> ошибка unique(student_id, course_code, semester)


-- task 3.3:
alter table users
add constraint unique_username unique (username),
add constraint unique_email unique (email);


-- task 4.1:
create table departments (
    dept_id int primary key,
    dept_name text not null,
    location text
);

insert into departments values
(1, 'it', 'almaty'),
(2, 'hr', 'astana'),
(3, 'finance', 'almaty');

-- ошибка: дубликат id
-- insert into departments values (1, 'sales', 'aktau'); -> ошибка primary key


-- task 4.2:
create table student_courses (
    student_id int,
    course_id int,
    enrollment_date date,
    grade text,
    primary key (student_id, course_id)
);

insert into student_courses values
(1, 10, '2025-01-01', 'a'),
(2, 11, '2025-02-01', 'b');

-- ошибка: повторная пара id
-- insert into student_courses values (1, 10, '2025-03-01', 'c'); -> ошибка primary key


-- task 5.1:
create table employees_dept (
    emp_id int primary key,
    emp_name text not null,
    dept_id int references departments(dept_id),
    hire_date date
);

insert into employees_dept values
(1, 'alex', 1, '2025-01-01'),
(2, 'maria', 2, '2025-02-01');

-- ошибка: dept_id не существует
-- insert into employees_dept values (3, 'sam', 10, '2025-03-01'); -> ошибка foreign key


-- task 5.2: 
create table authors (
    author_id int primary key,
    author_name text not null,
    country text
);

create table publishers (
    publisher_id int primary key,
    publisher_name text not null,
    city text
);

create table books (
    book_id int primary key,
    title text not null,
    author_id int references authors,
    publisher_id int references publishers,
    publication_year int,
    isbn text unique
);

insert into authors values
(1, 'tolstoy', 'russia'),
(2, 'rowling', 'uk');

insert into publishers values
(1, 'penguin', 'london'),
(2, 'ast', 'moscow');

insert into books values
(1, 'war and peace', 1, 2, 1869, '111'),
(2, 'harry potter', 2, 1, 1997, '222');


-- task 5.3:
create table categories (
    category_id int primary key,
    category_name text not null
);

create table products_fk (
    product_id int primary key,
    product_name text not null,
    category_id int references categories on delete restrict
);

create table orders_fk (
    order_id int primary key,
    order_date date not null
);

create table order_items (
    item_id int primary key,
    order_id int references orders_fk on delete cascade,
    product_id int references products_fk,
    quantity int check (quantity > 0)
);

-- 1. удаление категории с товарами — ошибка (restrict)
-- 2. удаление заказа — удаляются order_items (cascade)

create table customers_full (
    customer_id serial primary key,
    name text not null,
    email text unique not null,
    phone text,
    registration_date date not null
);

create table products_full (
    product_id serial primary key,
    name text not null,
    description text,
    price numeric not null check (price >= 0),
    stock_quantity int not null check (stock_quantity >= 0)
);

create table orders_full (
    order_id serial primary key,
    customer_id int references customers_full on delete cascade,
    order_date date not null,
    total_amount numeric not null check (total_amount >= 0),
    status text not null check (status in ('pending','processing','shipped','delivered','cancelled'))
);

create table order_details_full (
    order_detail_id serial primary key,
    order_id int references orders_full on delete cascade,
    product_id int references products_full on delete restrict,
    quantity int not null check (quantity > 0),
    unit_price numeric not null check (unit_price >= 0)
);

-- правильные данные
insert into customers_full (name, email, phone, registration_date) values
('john doe', 'john@example.com', '111111111', '2025-01-01'),
('anna smith', 'anna@example.com', '222222222', '2025-02-01'),
('mike brown', 'mike@example.com', '333333333', '2025-03-01'),
('kate johnson', 'kate@example.com', '444444444', '2025-04-01'),
('tom lee', 'tom@example.com', '555555555', '2025-05-01');

insert into products_full (name, description, price, stock_quantity) values
('laptop', 'gaming', 1200, 10),
('phone', 'smartphone', 800, 20),
('headphones', 'noise cancel', 150, 30),
('monitor', '4k', 300, 15),
('keyboard', 'mechanical', 100, 25);

insert into orders_full (customer_id, order_date, total_amount, status) values
(1, '2025-06-01', 2000, 'pending'),
(2, '2025-06-05', 800, 'processing'),
(3, '2025-06-10', 450, 'shipped'),
(4, '2025-06-15', 300, 'delivered'),
(5, '2025-06-20', 100, 'cancelled');

insert into order_details_full (order_id, product_id, quantity, unit_price) values
(1, 1, 1, 1200),
(1, 2, 1, 800),
(2, 2, 1, 800),
(3, 3, 3, 150),
(4, 4, 1, 300),
(5, 5, 1, 100);

-- тесты:
-- 1. повтор email — ошибка unique
-- 2. отрицательная цена — ошибка check
-- 3. статус не из списка — ошибка check
-- 4. quantity = 0 — ошибка check
-- 5. удаление заказа — удаляются order_details (cascade)
-- 6. удаление товара — запрещено (restrict)
