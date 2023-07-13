CREATE DEFINER=`root`@`localhost` PROCEDURE `RegisterUser`(
	in p_usr_email varchar(70),
    in p_usr_password varchar(50),
    in p_usr_type int,
    out msg varchar(300)
)
BEGIN
	declare email_duplicates int;
    declare user_exist int;
    
    select count(*) into email_duplicates
    from user_data 
    where user_email = p_usr_email and flag = 1;
    
    select count(*) into user_exist
    from user_type
    where user_type_ID = p_usr_type and flag = 1;
    
    if email_duplicates > 0 then
		set msg = 'You must enter unique email.';
	elseif user_exist = 0 then
		set msg = 'Type ID is not exist';
	else
		if p_usr_password is not null then
			insert into user_data(user_email, user_password, user_type)
            values(p_usr_email, p_usr_password, p_usr_type);
            set msg = 'User is inserted successfully.';
		else
			set msg = 'You must enter a password';
		end if;
	end if;
END