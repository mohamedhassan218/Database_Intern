CREATE DEFINER=`root`@`localhost` FUNCTION `CalculateSucessRatio`(f_c_ID int) RETURNS float
BEGIN
	declare result float;
    declare total_students int;
    declare succed int;
    set total_students = GetStudentsCount(f_c_ID);
    set succed = GetSuccedStudents(f_c_ID);
    set result = (succed / total_students) * 100;
RETURN result;
END