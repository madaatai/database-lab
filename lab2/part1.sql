-- Part 1

CREATE DATABASE university_main
    WITH OWNER = postgres
    TEMPLATE = template0
    ENCODING = 'UTF8';

CREATE DATABASE university_archive
    WITH TEMPLATE = template0
    CONNECTION LIMIT = 50;

CREATE DATABASE university_test
    WITH TEMPLATE = template0
    CONNECTION LIMIT = 10
    IS_TEMPLATE = true;

-- task 1.2

CREATE TABLESPACE student_data
    LOCATION 'C:/pgsql_data/students';

CREATE TABLESPACE course_data
    OWNER postgres
    LOCATION 'C:/pgsql_data/courses';

CREATE DATABASE university_distributed
    WITH TABLESPACE = student_data
    ENCODING = 'LATIN9';
    LC_CTYPE = 'C'
    LC_COLLATE = 'C'
    TEMPLATE = template0;
