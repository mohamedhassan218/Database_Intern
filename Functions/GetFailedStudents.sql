CREATE DEFINER=`root`@`localhost` FUNCTION `GetFailedStudents`(
	f_c_ID int
) RETURNS int(11)
BEGIN
	declare result int;
    select count(*) into result 
    from student_course
    where total_degree < 50 and c_ID = f_c_ID;
RETURN result;
END