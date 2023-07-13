CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertStudent`(
	in s_name varchar(300),
    in s_mobile varchar(20),
    in s_photo blob,
    in s_email varchar(60),
    in s_dob date,
    in s_age int,
    in s_gender varchar(10),
    in s_dID int,
    out msg varchar(300)
)
BEGIN
	DECLARE name_pattern VARCHAR(300);
    DECLARE email_pattern VARCHAR(200);
    DECLARE phone_pattern VARCHAR(40);
    DECLARE department_counter INT;
    DECLARE email_counter INT;
    
    SET name_pattern = '^[a-z A-Z\\s]+$';
    SET email_pattern = '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    SET phone_pattern = '^\\+20[0-9]{10}$'; 
    
    select count(*) into email_counter
    from student
    where student_email = s_email and flag = 1;
    
    select count(*) into department_counter
    from department
    where department_ID = s_dID and flag = 1;
    
    if email_counter > 0 then
		set msg = 'You must enter unique email.';
	elseif department_counter = 0 then
		set msg = 'Department ID is not found.';
	elseif s_name regexp name_pattern = 0 then
		set msg = 'Please enter a valid name.';
	elseif s_email regexp email_pattern = 0 then
		set msg = 'Please enter correct email.';
	elseif s_mobile regexp phone_pattern = 0 then
		set msg = 'Please enter a valid phone number.';
    else
		insert into student(student_name, mobile_number, profile_photo, student_email, date_of_birth, age, gender, d_ID)
        values(s_name, s_mobile, s_photo, s_email, s_dob, s_age, s_gender, s_dID);
        
        update department
        set number_of_students = number_of_students + 1
        where department_ID = s_dID;
        
        set msg = 'Student inserted successfully.';
        
	end if;
END