CREATE DEFINER=`root`@`localhost` PROCEDURE `TopTenInYear`(
	in p_y_ID int
)
BEGIN
	select student_name as 'Name', student_ID as 'ID', student_email as 'Email', profile_photo as 'Personal Image'
    from student
    where y_ID = p_y_ID
    order by total_degree desc
	limit 10;
END