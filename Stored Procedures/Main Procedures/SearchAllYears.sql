CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchAllYears`()
BEGIN
	select year_ID as 'Year ID', year_a as 'Year Name' from academic_year where flag = 1;
END