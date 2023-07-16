CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchStudentID`(
	IN p_s_ID INT
)
BEGIN
	SELECT student_name as 'Student Name', mobile_number as 'Mobile Number',
    profile_photo as 'Profile Picture', student_email as 'Student Email', date_of_birth as 'Date of Birth',
    age as 'Age', gender as 'Gender', department_name as 'Department' 
    FROM student INNER JOIN department ON student.d_ID = department.department_ID
    WHERE student_ID = p_s_ID AND student.flag = 1;
END