CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchAllDepartments`()
BEGIN
	SELECT department_ID as 'Department ID', department_name as 'Department Name',
    number_of_students as 'Number of Students', number_of_instructors as 'Number of Instructors',
    number_of_courses as 'Number of Courses'
    FROM department
	WHERE flag = 1;
END