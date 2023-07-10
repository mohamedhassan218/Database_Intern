CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateDepartment`(
    IN p_d_ID INT,
    IN p_d_name VARCHAR(200),
    OUT msg VARCHAR(200)
)
BEGIN
    DECLARE name_pattern VARCHAR(200);
    DECLARE name_exists INT;
    
    SELECT COUNT(*) INTO name_exists
    FROM department
    WHERE department_ID = p_d_ID;

    IF name_exists = 0 THEN
        SET msg = 'Department ID not found.';
    ELSE
        -- Check if the department name already exists
        SELECT COUNT(*) INTO name_exists
        FROM department
        WHERE department_name = p_d_name AND department_ID != p_d_ID;
        
        IF name_exists > 0 THEN
            SET msg = 'Department name already exists.';
        ELSE
            UPDATE department
            SET department_name = p_d_name
            WHERE department_ID = p_d_ID;
            SET msg = 'Department updated successfully.';
        END IF;
    END IF;
END