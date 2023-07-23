CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteUser`(
	in p_usr_ID int,
    out msg varchar(400)
)
BEGIN
    if not exists (select 1 from user_data where user_ID = p_usr_ID and flag = 1) then
		set msg = 'User is not found.';
	else
		update user_data
        set flag = 0
        where user_ID = p_usr_ID;
        set msg = 'User is deleted successfully.';
    end if;
END