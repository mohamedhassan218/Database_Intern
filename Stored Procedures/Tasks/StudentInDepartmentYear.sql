CREATE DEFINER=`root`@`localhost` PROCEDURE `StudentInDepartmentYear`(
	in p_d_ID int,
    in p_y_ID int
)
BEGIN
	select student_name as 'Name', mobile_number as 'Phone Number', student_email as 'Email', date_of_birth as 'Date of Birth', age as 'Age', gender as 'Gender', department_name as 'Department', year_a as 'Academic Year'
    from student
    inner join department on d_ID = department_ID
    inner join academic_year on y_ID = year_ID 
    where p_d_ID = d_ID and y_ID = p_y_ID and student.flag = 1;
END