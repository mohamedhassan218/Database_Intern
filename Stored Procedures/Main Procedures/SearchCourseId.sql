CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchCourseID`(
	IN p_c_ID INT
)
BEGIN
	SELECT course_name as 'Course Name', lectures_number as 'Number of Lectures',
    minimum_lectures as 'Minimum Number of Lectures', department_name as 'Department', instructor_name as 'Instructor Name',
    year_a as 'Academic Year' 
    FROM course 
    INNER JOIN department ON course.d_ID = department_ID
    INNER JOIN academic_year ON course.academic_year = year_ID 
    INNER JOIN instructor ON instructor.instructor_ID = course.i_ID
    WHERE course.flag = 1 AND course.course_ID = p_c_ID;
END