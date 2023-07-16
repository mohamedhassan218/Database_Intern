CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchDepartmentID`(
	IN p_d_ID INT
)
BEGIN
	SELECT department_name as 'Department Name', number_of_students as 'Number of Students', 
    number_of_instructors as 'Number of Instructors', number_of_courses as 'Number of Courses'
    FROM department 
	WHERE p_d_ID = department_ID;
END