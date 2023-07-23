CREATE DEFINER=`root`@`localhost` PROCEDURE `Login`(
	in usr_email varchar(70),
    in usr_password varchar(50),
    out msg varchar(400)
)
BEGIN
    if exists (select 1 from user_data where user_email = usr_email and user_password = usr_password) then
		set msg = 'Successful Login';
	else
		set msg = 'Invalid email or password.';
	end if;
END