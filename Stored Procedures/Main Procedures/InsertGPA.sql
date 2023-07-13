CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertGPA`(
	in p_grades_upper int,
    in p_grades_less int,
    in p_rate varchar(5)
)
BEGIN
	insert into gpa(grades_upper, grades_less, rate)
    values(p_grades_upper, p_grades_less, p_rate);
END