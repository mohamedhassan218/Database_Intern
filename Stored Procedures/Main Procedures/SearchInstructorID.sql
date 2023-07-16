CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchInstructorID`(
	IN p_i_ID INT
)
BEGIN
	SELECT instructor_name as 'Instructor Name',
    instructor_email as 'Instructor Email', phone_number as 'Phone Number',
    specialty as 'Specialty', room_number as 'Room Number', office_hours as 'Office Hours',
    instructor_type as 'Type of Instructor', department_name as 'Department' 
    FROM instructor INNER JOIN department ON department.department_ID = instructor.d_ID
    WHERE instructor_ID = p_i_ID AND instructor.flag = 1;
END