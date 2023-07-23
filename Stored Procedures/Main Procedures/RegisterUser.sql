CREATE DEFINER=`root`@`localhost` PROCEDURE `RegisterUser`(
	in p_usr_email varchar(70),
    in p_usr_password varchar(50),
    in p_usr_type int,
    out msg varchar(300)
)
BEGIN
	declare password_pattern varchar(300);
    declare hashed_pass varchar(500);
    set password_pattern = '^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[^A-Za-z\d]).{8,}$';
    if exists (select 1 from user_data where user_email = p_usr_email and flag = 1) then
		set msg = 'You must enter unique email.';
    elseif not exists (select 1 from user_type where user_type_ID = p_usr_type and flag = 1) then
		set msg = 'Type ID is not exist';
	else
		if p_usr_password is not null then
			if p_usr_password regexp password_pattern = 0 then
				set msg = 'Your password must contain capital and small letters, numbers and signs.';
			else 
				set hashed_pass = password(p_usr_password);
				insert into user_data(user_email, user_password, user_type)
				values(p_usr_email, hashed_pass, p_usr_type);
				set msg = 'User is inserted successfully.';
			end if;
        else
			set msg = 'You must enter a password';
		end if;
	end if;
END