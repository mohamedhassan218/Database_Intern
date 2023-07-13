CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertUserType`(
	in p_type varchar(45),
    out msg varchar(300)
)
BEGIN
	declare type_duplicates int;
    
    select count(*) into type_duplicates
    from user_type
    where user_type_a = p_type;
    
    if type_duplicates = 0 then 
		insert into user_type(user_type_a)
        values(p_type);
        set msg = 'Type is inserted successfully.';
	else	
		set msg = 'Type is already exist.';
	end if;
END