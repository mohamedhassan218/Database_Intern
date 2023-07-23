CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateUserType`(
	in p_usr_ID int,
    in p_usr_new_type int,
    out msg varchar(300)
)
BEGIN
    if exists (select 1 from user_data where user_ID = p_usr_ID and flag = 1) then
		set msg = 'User ID is not found.';
	else
        if exists (select 1 from user_type where user_type_ID = p_usr_ID) then
			update user_data
            set user_type = p_usr_new_type
            where user_ID = p_usr_ID;
            set msg = 'User type updated successfully.';
		else
			set msg = 'Type id is not found.';
        end if;
	end if;
END