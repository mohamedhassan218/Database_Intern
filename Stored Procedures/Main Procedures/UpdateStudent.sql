CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateStudent`(
	in s_ID int,
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
    
    SET name_pattern = '^[a-z A-Z\\s]+$';
    SET email_pattern = '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    SET phone_pattern = '^\\+20[0-9]{10}$'; 
    
    if exists (select 1 from student where student_email = s_email and flag = 1 and student_ID != s_ID) then
		set msg = 'You must enter unique email.';
	elseif s_name regexp name_pattern = 0 then
		set msg = 'Please enter a valid name.';
	elseif s_email regexp email_pattern = 0 then
		set msg = 'Please enter correct email.';
	elseif s_mobile regexp phone_pattern = 0 then
		set msg = 'Please enter a valid phone number.';
	elseif exists (select 1 from department where department_ID = s_dID and flag = 1) then
		update student
        set student_name = s_name, mobile_number = s_mobile, profile_photo = s_photo, student_email = s_email, date_of_birth = s_dob, age = s_age, gender = s_gender, d_ID = s_dID
        where student_ID = s_ID;
        set msg = 'Student updated successfully.';
    else
		set msg = 'Department ID is not found.';
	end if;
END