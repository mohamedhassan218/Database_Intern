CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertUserType`(
	in p_type varchar(45),
    out msg varchar(300)
)
BEGIN 
    if p_type is null then
		set msg = 'Type can not be null.';
	else
        if not exists (select 1 from user_type where user_type_a = p_type) then
			insert into user_type(user_type_a)
			values(p_type);
			set msg = 'Type is inserted successfully.';
		else	
			set msg = 'Type is already exist.';
		end if;
   end if;
END