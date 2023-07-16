CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchExamID`(
	IN p_e_ID INT
)
BEGIN
	SELECT exam_name as 'Exam Name', exam_date as 'Date of Exam',
    start_time as 'Start Time', end_time as 'End Time', duration as 'Duration',
    number_of_questions as 'Number of Questions', degree as 'Degree', exam_type as 'Type of Exam',
    course_name as 'Course Name'
    FROM exam INNER JOIN course ON course.course_ID = exam.c_ID
	WHERE exam_ID = p_e_ID AND exam.flag = 1;
END