CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteDepartmentID`(
	IN p_d_ID INT,
    out msg varchar(400)
)
BEGIN
	if number_of_instructors > 0 or number_of_courses > 0 or number_of_students > 0 then
		set msg = 'Department can not be deleted';
	else
		UPDATE department
		SET flag = 0
		WHERE department_ID = p_d_ID;
	end if;
END