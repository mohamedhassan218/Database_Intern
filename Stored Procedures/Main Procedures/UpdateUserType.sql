CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateUserType`(
	in p_usr_ID int,
    in p_usr_new_type int,
    out msg varchar(300)
)
BEGIN
	declare usr_exist int;
    declare type_exist int;
    
	SELECT COUNT(*) INTO usr_exist
	FROM user_data
	WHERE user_ID = p_usr_ID AND flag = 1;

	IF usr_exist = 0 THEN
		SET msg = 'User ID is not found.';
	ELSE
		select count(*) into type_exist
        from user_type
        where user_type_ID = p_usr_ID;
		
        if type_exist = 0 then
			set msg = 'Type id is not found.';
		else
			update user_data
            set user_type = p_usr_new_type
            where user_ID = p_usr_ID;
            set msg = 'User type updated successfully.';
        end if;
	END IF;
END