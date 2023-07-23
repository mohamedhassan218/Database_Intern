CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertStudent`(
	in s_name varchar(300),
    in s_mobile varchar(20),
    in s_photo blob,
    in s_email varchar(60),
    in s_dob date,
    in s_gender varchar(10),
    in s_dID int,
    out msg varchar(300)
)
BEGIN
	declare s_age int;
	DECLARE name_pattern VARCHAR(300);
    DECLARE email_pattern VARCHAR(200);
    DECLARE phone_pattern VARCHAR(40);
    SET name_pattern = '^[a-z A-Z\\s]+$';
    SET email_pattern = '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    SET phone_pattern = '^\\+20[0-9]{10}$'; 
	if s_name is null then set msg = 'Name can not be null.';
    elseif s_mobile is null then set msg = 'Mobile number must be specified.';
    elseif s_photo is null then set msg = 'Photo must be filled.';
    elseif s_email is null then set msg = 'Student email is required.';
    elseif s_dob is null then set msg = 'You must specify the date of birth.';
    elseif s_gender is null then set msg = 'Student gender must be specified.';
    elseif s_dID is null then set msg = 'Department ID is required field.';
    else
        set s_age = DATEDIFF(CURRENT_DATE, s_dob) / 365;
		
        if exists (select 1 from student where student_email = s_email and flag = 1) then
			set msg = 'You must enter unique email.';
		elseif not exists (select 1 from department where department_ID = s_dID and flag = 1) then
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
	end if;
END