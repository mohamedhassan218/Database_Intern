CREATE DEFINER=`root`@`localhost` PROCEDURE `ExamsInCurrentMonth`()
BEGIN
	select exam_name as 'Exam Name', exam_ID as 'ID', start_time as 'Starts At', end_time as 'Ends At', number_of_questions as 'Number of Questions', degree as 'Degree'
	from exam
    where month(exam_date) = month(current_date()) and year(exam_date) = year(current_date());
END