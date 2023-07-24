CREATE DEFINER=`root`@`localhost` PROCEDURE `SuccessRatio`(
	in p_c_ID int
)
BEGIN
	declare failed int;
    declare succed int;
    declare ratio float;
    declare course_n varchar(300);
    
    set failed = GetFailedStudents(p_c_ID);
    set succed = GetSuccedStudents(p_c_ID);
    set ratio = CalculateSucessRatio(p_c_ID);
    
    select course_name into course_n from course where course_ID = p_c_ID and flag = 1 ;
    select failed as 'Number of Failed', succed as 'Number of Succed Students', ratio as 'Success Ratio', course_n as 'Course Name';
END