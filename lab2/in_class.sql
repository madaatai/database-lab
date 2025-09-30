create database elearning_platform

create tablespace video_storage
    LOCATION 'C:\data\videos';


create table online_videos(
    video_id SERIAL primary key,
    course_id int,
    video_title VARCHAR(100),
    video_discription TEXT,
    video_duration TIMESTAMP WITHOUT TIMEZONE,
    file_size BIGINT,
    upload_date DATE,
    is_public BOOLEAN,
    view_count int
)

create table student_progress(
    progress_id SERIAL primary key,
    student_id int,
    video_id int,
    watch_percenatge numerical(10, 1) ,
    last_watched TIMESTAMP WITH TIMEZONE,
    completed BOOLEAN,
    notes TEXT,
    bookmark_time TIMESTAMP WITHOUT TIMEZONE
)

ALTER TABLE courses
    ADD COLUMN is_online_available BOOLEAN SET DEFAULT 'false';

ALTER TABLE courses 
    ADD COLUMN platform_url varchar(200);

ALTER TABLE students
    ADD COLUMN preferred_language char(5);

ALTER TABLE students
    ADD COLUMN last_login TIMESTAMP WITHOUT TIMEZONE;


create table statement(
    id SERIAL int,
    student_reference int,
    quiz_name varchar (80),
    start_time TIMESTAMP WITH TIMEZONE,
    duration_taken TYPE interval,
    score numerical(10, 2),
    passed_status BOOLEAN,
    attempt_number SMALLINT
)