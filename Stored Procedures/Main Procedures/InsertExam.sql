CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertExam`(
    IN e_name VARCHAR(200),
    IN e_date DATE,
    IN e_s_time TIME,
    IN e_e_time TIME,
    IN e_number_of_questions INT,
    IN e_degree INT,
    IN exam_type VARCHAR(10),
    IN e_c_ID INT,
    in p_author_ID int,
    OUT msg VARCHAR(300)
)
BEGIN
    DECLARE FLAG INT;
    declare e_duration int;
    -- Permissions: only admins or instructor that teach the course can insert new exam.
    declare p_usr_type int;
    declare p_ins_ID int;
    declare p_c_I_ID int;
    
    set FLAG = 1;
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
        if not exists (select 1 from course where course_ID = e_c_ID and flag = 1) then
			set msg = 'Course is not found.';
            set FLAG = 0;
        end if;
        
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
			
           -- Check the user type.
			select user_type into p_usr_type 
			from user_data
			where user_ID = p_author_ID and flag = 1; 
        
			-- Get the instructor id of the course.
			select i_ID into p_ins_ID
			from user_data
			where user_ID = p_author_ID and flag = 1;
            
            -- Ensure that course is tought with the same instructor.alter
            select i_ID into p_c_I_ID
            from course
            where course_ID = e_c_ID and flag = 1;
            
			 if p_ins_ID = p_c_I_ID or p_usr_type = 1 then	
				INSERT INTO exam (exam_name, exam_date, start_time, end_time, duration, number_of_questions, degree, exam_type, c_ID, author)
				VALUES (e_name, e_date, e_s_time, e_e_time, e_duration, e_number_of_questions, e_degree, exam_type, e_c_ID, p_author_ID);
				SET msg = 'Exam inserted successfully.';
			else
				set msg = 'You do not have the permission to update this course.';
			end if;
		END IF;
	end if;
END