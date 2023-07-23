CREATE DEFINER=`root`@`localhost` PROCEDURE `StudentsNumberInDepartment`(
	in p_d_ID int
)
BEGIN
	select number_of_students as 'Number of Students' 
    from department 
    where department_ID = p_d_ID and flag = 1;
END