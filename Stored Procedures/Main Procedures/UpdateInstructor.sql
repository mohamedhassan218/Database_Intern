CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateInstructor`(
	IN p_i_ID INT,
    IN p_new_i_name VARCHAR(300),
    IN p_new_i_email VARCHAR(60),
    IN p_new_i_phone VARCHAR(20),
    IN p_new_i_specialty VARCHAR(150),
    IN p_new_i_room_number INT,
    IN p_new_i_office_hours VARCHAR(400),
    IN p_new_i_type VARCHAR(50),
    IN p_new_i_dID INT,
    OUT msg VARCHAR(200)	
)
BEGIN
	DECLARE name_pattern VARCHAR(300);
    DECLARE email_pattern VARCHAR(200);
    DECLARE phone_pattern VARCHAR(40);

    SET name_pattern = '^[a-z A-Z\\s]+$';
    SET email_pattern = '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    SET phone_pattern = '^\\+20[0-9]{10}$'; 
    
    
	if exists (select 1 from instructor where instructor_email = p_new_i_email and instructor_ID != p_i_ID) then
		SET msg = 'Your email must be unique.';
    elseif p_new_i_name REGEXP name_pattern = 0 THEN
		SET msg = 'Invalid name.';
	elseif p_new_i_phone REGEXP phone_pattern = 0 THEN
       SET msg = 'Invalid phone number.';
	elseif p_new_i_email REGEXP email_pattern = 0 THEN
        SET msg = 'Invalid email.';
	elseif exists (select 1 from department where department_ID = p_new_i_dID) then
		update instructor
        set instructor_name = p_new_i_name, instructor_email = p_new_i_email, phone_number = p_new_i_phone, specialty = p_new_i_specialty, room_number = p_new_i_room_number, office_hours = p_new_i_office_hours, instructor_type = p_new_i_type, d_ID = p_new_i_dID
        where instructor_ID = p_i_ID;
		set msg = 'Instructor updated successfully.';
	 else
		set msg = 'Invalid Instructor ID.';
    end if;
END