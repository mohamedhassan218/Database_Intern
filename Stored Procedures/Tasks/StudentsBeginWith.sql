CREATE DEFINER=`root`@`localhost` PROCEDURE `StudentsBeginWith`(
	in p_character varchar(1)
)
BEGIN
    select student_name as 'Name', student_ID as 'ID', student_email as 'Email'
    from student
    where student_name like concat(p_character,'%');
END