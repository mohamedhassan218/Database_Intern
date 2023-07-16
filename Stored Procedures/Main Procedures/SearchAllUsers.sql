CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchAllUsers`()
BEGIN
	SELECT user_ID as 'User ID', user_email as 'User Email', user_password as 'Password', user_type_a as 'Type' 
    FROM user_data INNER JOIN user_type ON user_data.user_type = user_type.user_type_ID WHERE user_data.flag = 1;
END