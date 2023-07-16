CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteYear`(
	in p_y_ID int
)
BEGIN
	update academic_year
    set flag = 0
    where year_ID = p_y_ID;
END