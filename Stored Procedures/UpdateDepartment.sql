CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateDepartment`(
    IN p_d_ID INT,
    IN p_d_name VARCHAR(200),
    OUT msg VARCHAR(200)
)
BEGIN
    DECLARE name_pattern VARCHAR(200);
    DECLARE name_exists INT;
    
    SET name_pattern = '^[a-zA-Z\s]+$';
    
    -- Check if the department ID exists
    SELECT COUNT(*) INTO name_exists
    FROM department
    WHERE department_ID = p_d_ID;
    
    IF name_exists = 0 THEN
        SET msg = 'Department ID not found.';
    ELSEIF p_d_name REGEXP name_pattern = 0 THEN
        SET msg = 'Invalid department name.';
    ELSE
        -- Check if the department name already exists
        SELECT COUNT(*) INTO name_exists
        FROM department
        WHERE department_name = p_d_name
        AND department_ID != p_d_ID;
        
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