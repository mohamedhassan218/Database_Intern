CREATE DEFINER=`root`@`localhost` PROCEDURE `NonGraduateStudents`()
BEGIN
	select student_name as 'Student Name', student_ID as 'Student ID', student_email as 'Email', mobile_number as 'Phone Number', department_name as 'Department'
    from student
    inner join department on department_ID = d_ID
    where y_ID != 4;
END