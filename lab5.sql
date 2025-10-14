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
