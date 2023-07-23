CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertInstructor`(
    IN p_i_name VARCHAR(300),
    IN p_i_email VARCHAR(60),
    IN p_i_phone VARCHAR(20),
    IN p_i_specialty VARCHAR(150),
    IN p_i_room_number INT,
    IN p_i_office_hours VARCHAR(400),
    IN p_i_type VARCHAR(50),
    IN p_i_dID INT,
    OUT msg VARCHAR(200)
)
BEGIN
    DECLARE name_pattern VARCHAR(300);
    DECLARE email_pattern VARCHAR(200);
    DECLARE phone_pattern VARCHAR(40);

    SET name_pattern = '^[a-z A-Z\\s]+$';
    SET email_pattern = '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    SET phone_pattern = '^\\+20[0-9]{10}$'; 

    if p_i_name is null then 
		set msg = 'Name can not be null.';
    elseif p_i_email is  null then 
		set msg = 'Email must be specified.';
    elseif p_i_phone is null then 
		set msg = 'Phone number can not be null.';
    elseif p_i_specialty is null then 
		set msg = 'Specialty must be specified.';
    elseif p_i_room_number is null then 
		set msg = 'You must specify the room number.';
	elseif p_i_office_hours is null then
		set msg = 'You must specify the office hours.';
	elseif p_i_type is null then
		set msg = 'Instructor type must be filled.';
	elseif p_i_dID is null then
		set msg = 'Department Id can not be null.';
	else
        if not exists (select 1 from department where department_ID = p_i_dID) then
			set msg = 'Department is not found.';
        elseif exists (select 1 from instructor where instructor_email = p_i_email) then
			set msg = 'Email must be unique.';
		ELSEIF p_i_name REGEXP name_pattern = 0 THEN
			SET msg = 'Invalid name.';
		ELSEIF p_i_phone REGEXP phone_pattern = 0 THEN
			SET msg = 'Invalid phone number.';
		ELSEIF p_i_email REGEXP email_pattern = 0 THEN
			SET msg = 'Invalid email.';
		ELSE
			INSERT INTO instructor (instructor_name, instructor_email, phone_number, specialty, room_number, office_hours, instructor_type, d_ID)
			VALUES (p_i_name, p_i_email, p_i_phone, p_i_specialty, p_i_room_number, p_i_office_hours, p_i_type, p_i_dID);
        
			update department
			set number_of_instructors = number_of_instructors + 1
			where department_ID = p_i_dID;
        
			SET msg = 'Instructor inserted successfully.';
		END IF;
	end if;
END