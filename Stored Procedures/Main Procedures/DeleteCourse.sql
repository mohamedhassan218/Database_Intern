CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteCourse`(
	IN p_c_ID INT,
    IN p_author_ID INT,
    OUT msg VARCHAR(300)
)
BEGIN
	-- Permissions: only admins and instructors who teach the course can delete it.
    DECLARE p_usr_type INT;
    DECLARE p_usr_ID INT;
	
    IF EXISTS (SELECT c_ID FROM student_course WHERE c_ID = p_c_ID AND flag = 1) THEN
		SET msg = 'This course cannot be deleted because students are enrolled in it.';
	ELSE
		-- Check the user type.
        SELECT user_type INTO p_usr_type 
        FROM user_data
        WHERE user_ID = p_author_ID AND flag = 1; 
        
        -- Get the instructor id of the course.
        SELECT i_ID INTO p_usr_ID
        FROM course
        WHERE course_ID = p_c_ID AND flag = 1;
        
        IF p_usr_ID = p_author_ID OR p_usr_type = 1 THEN
			-- Decrease the number_of_courses for the department that the course belongs to.
			UPDATE department
			SET number_of_courses = number_of_courses - 1
			WHERE department_ID = (SELECT d_ID FROM course WHERE course_ID = p_c_ID AND flag = 1);
            
            -- Soft delete the course (set the flag to 0).
			UPDATE course
			SET flag = 0
			WHERE course_ID = p_c_ID;
			
			SET msg = 'Course is deleted successfully.';
		ELSE
			SET msg = 'You do not have permission to delete this course.';
		END IF;
	END IF;
END