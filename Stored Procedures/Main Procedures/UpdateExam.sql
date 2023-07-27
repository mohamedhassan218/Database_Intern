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
    in p_author_ID int,
    OUT msg VARCHAR(300)
)
BEGIN
	declare FLAG int;
    -- Permissions: only admins or instructor that teach the course can update exam.
    declare p_usr_type int;
    declare p_ins_ID int;
    declare p_c_IID int;
    set flag = 1;
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
        if exists (select 1 from course where course_ID = e_c_ID and flag = 1) then
			
            -- Check the user type.
			select user_type into p_usr_type 
			from user_data
			where user_ID = p_author_ID and flag = 1; 
        
			-- Get the instructor id of the course.
			select i_ID into p_ins_ID
			from user_data
			where user_ID = p_author_ID and flag = 1;
            
            -- Ensure that course is tought with the same instructor.alter
            select i_ID into p_c_IID
            from course
            where course_ID = e_c_ID and flag = 1;
            
            if p_ins_ID = p_c_IID or p_usr_type = 1 then	
				UPDATE exam
				SET exam_name = e_name, exam_date = e_date, start_time = e_s_time, end_time = e_e_time, duration = e_duration, number_of_questions = e_number_of_questions, degree = e_degree, exam_type =  e_type, c_ID = e_c_ID
				WHERE exam_ID = e_ID AND flag = 1;
				SET msg = 'Exam updated successfully.';
			else
				set msg = 'You do not have the permission to update the exam.';
			end if;
		else
			set msg = 'Course ID is not found.';
        end if;
    END IF;
END