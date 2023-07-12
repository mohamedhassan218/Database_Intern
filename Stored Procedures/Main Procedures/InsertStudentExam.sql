CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertStudentExam`(
	IN STUDENT_ID INT,
    IN EXAM_ID INT
)
BEGIN
	DECLARE S_ID INT;
    DECLARE E_ID INT;
    
    SELECT COUNT(*) INTO S_ID
    FROM student
    WHERE student_ID = STUDENT_ID AND flag = 1;
    
    SELECT COUNT(*) INTO E_ID
    FROM exam
    WHERE exam_ID = EXAM_ID AND flag = 1;
    
    IF S_ID > 0 AND E_ID > 0 THEN 
		INSERT INTO student_exam(s_ID, e_ID)
        VALUES(STUDENT_ID, EXAM_ID);
    END IF;
END