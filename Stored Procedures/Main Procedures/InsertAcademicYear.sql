CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertAcademicYear`(
	in p_year varchar(80),
    out msg varchar(300)
)
BEGIN
	declare year_duplicates int;
    select count(*) into year_duplicates
    from academic_year
    where year_a = p_year;
    if year_duplicates = 0 then
		insert into academic_year(year_a)
        values(p_year);
        set msg = 'Academic Year inserted successfully.';
	else
		set msg = 'Year must be unique.';
	end if;
END