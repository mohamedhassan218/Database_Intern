CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteYear`(
	in p_y_ID int,
    out msg varchar(300)
)
BEGIN
    if exists (select 1 from academic_year where year_ID = p_y_ID and flag = 1) then
		if not exists (select 1 from student_year where y_ID = p_y_ID and flag = 1) then
			if not exists(select 1 from course where y_ID = p_y_ID and flag = 1) then
				update academic_year
				set flag = 0
				where year_ID = p_y_ID;
				set msg = 'Year is deleted successfully.';
			else
				set msg = 'Year can not be deleted due to course in it.';
			end if;
		else
			set msg = 'Year can not be deleted due to students in it.';
		end if;
	else
		set msg = 'Year can not be found.';
	end if;
END