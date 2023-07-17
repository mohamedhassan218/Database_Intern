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
	if e_name is null then
		set msg = 'Exam name can not be null.';
	elseif e_date is null then
		set msg = 'Exam date can not be null.';
	elseif e_s_time is null then
		set msg = 'You must specify the start time of the exam.';
	elseif e_e_time is null then
		set msg = 'You must specify the end time of the exam.';
	elseif e_number_of_questions is null then
		set msg = 'You must specify the number of questions of the exam.';
	elseif e_degree is null then
		set msg = 'The degree must be specified.';
	elseif exam_type is null then
		set msg = 'You must specify the type of the exam.';
	elseif e_c_ID is null then
		set msg = 'Course id must be specified.';
	else
		SET e_duration = TIME_TO_SEC(TIMEDIFF(e_e_time, e_s_time)) / 3600;
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
	end if;
END