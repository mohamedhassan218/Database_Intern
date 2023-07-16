CREATE DEFINER=`root`@`localhost` PROCEDURE `Login`(
	in usr_email varchar(70),
    in usr_password varchar(50),
    out msg varchar(400)
)
BEGIN
	declare cntr int;
    select user_ID into cntr
    from user_data
    where user_email = usr_email and user_password = usr_password;
    if cntr > 0 then
		set msg = 'Successful Login';
	else
		set msg = 'Invalid email or password';
	end if;
END