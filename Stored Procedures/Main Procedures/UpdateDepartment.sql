CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateDepartment`(
    IN p_d_ID INT,
    IN p_d_name VARCHAR(200),
    OUT msg VARCHAR(200)
)
BEGIN
    if exists (select 1 from department where department_ID = p_d_ID) then
		if exists (select 1 from department where department_name = p_d_name and department_ID != p_d_ID) then
			set msg = 'Department name must be unique.';
		else
			UPDATE department
            SET department_name = p_d_name
            WHERE department_ID = p_d_ID;
            SET msg = ' uDepartmentpdated successfully.';
		end if;
	else	
		set msg = 'Department ID is not found.';
	end if;
END