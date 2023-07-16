CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchDepartmentName`(
	IN p_d_name VARCHAR(200)
)
BEGIN
	SELECT department_ID as 'Department ID', number_of_students as 'Number of Students', 
    number_of_instructors as 'Number of Instructors', number_of_courses as 'Number of Courses'
    FROM department 
	WHERE p_d_name = department_name;
END