CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteYear`(
	in p_y_ID int,
    out msg varchar(300)
)
BEGIN
	declare year_exist int;
    declare stu_year_exist int;
    declare course_year_exist int;
    
    select count(*) into year_exist
    from academic_year
    where year_ID = p_y_ID and flag = 1;
    
    if year_exist > 0 then
		select count(*) into stu_year_exist
        from student_year
        where y_ID = p_y_ID;
    
		select count(*) into course_year_exist
        from course
        where y_ID = p_y_ID and flag = 1;
        
        if stu_year_exist > 0 then
			set msg = 'Year can not be deleted due to students in it.';
		elseif course_year_exist > 0 then
			set msg = 'Year can not be deleted due to course in it.';
		else
			update academic_year
			set flag = 0
			where year_ID = p_y_ID;
			set msg = 'Year is deleted successfully.';
		end if;
    else
		set msg = 'Year is not existed';
	end if;
END