CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertAcademicYear`(
	in p_year varchar(80),
    out msg varchar(300)
)
BEGIN
	if p_year is null then
		set msg = 'Year can not be null.';
	else
        if not exists(select 1 from academic_year where year_a = p_year) then
			insert into academic_year(year_a)
			values(p_year);
			set msg = 'Academic Year inserted successfully.';
		else
			set msg = 'Year must be unique.';
		end if;
	end if;
END