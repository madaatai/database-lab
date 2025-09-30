-- Part 3
-- Task 3.1

ALTER TABLE students
    ADD COLUMN middle_name VARCHAR(30);

ALTER TABLE students
    ADD COLUMN student_status VARCHAR(20);

ALTER TABLE students
    ALTER COLUMN phone TYPE VARCHAR(20);

ALTER TABLE students
    ALTER COLUMN student_status SET DEFAULT 'ACTIVE';

ALTER TABLE students
    ALTER COLUMN gpa SET DEFAULT 0.00;

ALTER TABLE professors
    ADD COLUMN department_code CHAR(5);

ALTER TABLE professors
    ADD COLUMN research_area TEXT;

ALTER TABLE professors
    ALTER COLUMN years_experience TYPE SMALLINT;

ALTER TABLE professors
    ALTER COLUMN is_tenured SET DEFAULT FALSE;

ALTER TABLE professors
    ADD COLUMN last_promotion_date DATE;

ALTER TABLE courses
    ADD COLUMN prerequisite_course_id INTEGER;

ALTER TABLE courses
    ADD COLUMN difficulty_level SMALLINT;

ALTER TABLE courses
    ALTER COLUMN course_code TYPE VARCHAR(10);

ALTER TABLE courses
    ALTER COLUMN credits SET DEFAULT 3;

ALTER TABLE courses
    ADD COLUMN lab_required BOOLEAN DEFAULT FALSE;

-- Task 3.2

ALTER TABLE class_schedule
    ADD COLUMN room_capacity INTEGER;

ALTER TABLE class_schedule
    DROP COLUMN duration;

ALTER TABLE class_schedule
    ADD COLUMN session_type VARCHAR(15);

ALTER TABLE class_schedule
    ALTER COLUMN classroom TYPE VARCHAR(30);

ALTER TABLE class_schedule
    ADD COLUMN equipment_needed TEXT;

ALTER TABLE student_records
    ADD COLUMN extra_credit_points NUMERIC(4,1);

ALTER TABLE student_records
    ALTER COLUMN grade TYPE VARCHAR(5);

ALTER TABLE student_records
    ALTER COLUMN extra_credit_points SET DEFAULT 0.0;

ALTER TABLE student_records
    ADD COLUMN final_exam_date DATE;

ALTER TABLE student_records
    DROP COLUMN last_updated;