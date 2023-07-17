CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertGPA`(
	in p_grades_upper int,
    in p_grades_less int,
    in p_rate varchar(5),
    out msg varchar(500)
)
BEGIN
	if p_grades_upper is null then
		set msg = 'The lower bound can not be null.';
	elseif p_grades_less is null then
		set msg = 'The upper bound can not be null.';
	elseif p_rate is null then
		set msg = 'You must specify the character to represent the grade between the lower and upper bound.';
	else
		insert into gpa(grades_upper, grades_less, rate)
		values(p_grades_upper, p_grades_less, p_rate);
		set msg = 'GPA is inserted successfully.';
	end if;
END