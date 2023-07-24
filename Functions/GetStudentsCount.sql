CREATE DEFINER=`root`@`localhost` FUNCTION `GetStudentsCount`(f_c_ID int) RETURNS int(11)
BEGIN
	declare result int;
    select count(*) into result
    from student_course
	where c_ID = f_c_ID;
RETURN result;
END