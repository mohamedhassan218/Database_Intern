CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertStudentYear`(
	in p_s_ID int,
    in p_y_ID int,
    out msg varchar(400)
)
BEGIN
	declare student_exist int;
    declare year_exist int;
    
    select count(*) into student_exist
    from student
    where student_ID = p_s_ID and flag = 1;

	select count(*) into year_exist
    from academic_year
    where year_ID = p_y_ID;

	if student_exist > 0 and year_exist > 0 then
		insert into student_year(s_ID, y_ID)
        values(p_s_ID, p_y_ID);
        set msg = 'Succedded.';
	else
		if student_exist = 0 then
			set msg = 'Student is not found.';
		else
			set msg = 'Year id is not found.';
		end if;
	end if;
END