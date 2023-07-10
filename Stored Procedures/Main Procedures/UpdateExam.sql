CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateExam`(
	IN e_ID INT,
    IN e_name VARCHAR(200),
    IN e_date DATE,
    IN e_s_time TIME,
    IN e_e_time TIME,
    IN e_duration INT,
    IN e_number_of_questions INT,
    IN e_degree INT,
    IN e_type VARCHAR(10),
    IN e_c_ID INT,
    OUT msg VARCHAR(300)
)
BEGIN
	DECLARE C_ID INT DEFAULT 0;
    DECLARE FLAG INT DEFAULT 1;
    
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
        UPDATE exam
        SET exam_name = e_name, exam_date = e_date, start_time = e_s_time, end_time = e_e_time, duration = e_duration, number_of_questions = e_number_of_questions, degree = e_degree, exam_type =  e_type, c_ID = e_c_ID
        WHERE exam_ID = e_ID AND flag = 1;
        SET msg = 'Exam updated successfully.';
    END IF;
END