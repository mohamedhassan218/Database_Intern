CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertStudentYear`(
	in p_s_ID int,
    in p_y_ID int,
    out msg varchar(400)
)
BEGIN
    if p_s_ID is null then
		set msg = 'Student ID must be specified.';
	elseif p_y_ID is null then 
		set msg = 'Year ID is required.';
	else
        if exists (select 1 from student where student_ID = p_s_ID and flag = 1) then
			if exists (select 1 from academic_year where year_ID = p_y_ID) then
				insert into student_year(s_ID, y_ID)
				values(p_s_ID, p_y_ID);
				set msg = 'Succedded.';
			else
				set msg = 'Year is not found.';
			end if;
		else
			set msg = 'Student is not found.';
        end if;
	end if;
END