CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertExam`(
    IN e_name VARCHAR(200),
    IN e_date DATE,
    IN e_s_time TIME,
    IN e_e_time TIME,
    IN e_number_of_questions INT,
    IN e_degree INT,
    IN exam_type VARCHAR(10),
    IN e_c_ID INT,
    OUT msg VARCHAR(300)
)
BEGIN
    DECLARE C_ID INT DEFAULT 0;
    DECLARE FLAG INT DEFAULT 1;
    declare e_duration int;
    set e_duration = TIMEDIFF(e_e_time, e_s_time);
    -- Check if the course exists and is active
    SELECT COUNT(*) INTO C_ID
    FROM course
    WHERE course_ID = e_c_ID AND flag = 1;
    
    IF C_ID <= 0 THEN
        SET msg = 'The course is not found.';
        SET FLAG = 0;
    END IF;

    IF e_e_time <= e_s_time THEN
        SET msg = 'Please enter valid start and end times.';
        SET FLAG = 0;
    END IF;

    IF e_date IS NULL THEN
        SET msg = 'You must specify the date of the exam.';
        SET FLAG = 0;
    END IF;

    IF e_duration <= 0 THEN
        SET msg = 'The duration must be a positive value.';
        SET FLAG = 0;
    END IF;

    IF FLAG = 1 THEN
        INSERT INTO exam (exam_name, exam_date, start_time, end_time, duration, number_of_questions, degree, exam_type, c_ID)
        VALUES (e_name, e_date, e_s_time, e_e_time, e_duration, e_number_of_questions, e_degree, exam_type, e_c_ID);
        SET msg = 'Exam inserted successfully.';
    END IF;
END