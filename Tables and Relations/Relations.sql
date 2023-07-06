USE university_db;

ALTER TABLE `university_db`.`instructor` 
ADD CONSTRAINT 
  FOREIGN KEY (`d_ID`)
  REFERENCES `university_db`.`department` (`department_ID`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE;

ALTER TABLE `university_db`.`course` 
ADD CONSTRAINT 
  FOREIGN KEY (`d_ID`)
  REFERENCES `university_db`.`department` (`department_ID`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE;

ALTER TABLE `university_db`.`student` 
ADD CONSTRAINT 
  FOREIGN KEY (`d_ID`)
  REFERENCES `university_db`.`department` (`department_ID`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE;

ALTER TABLE `university_db`.`course` 
ADD CONSTRAINT 
  FOREIGN KEY (`i_ID`)
  REFERENCES `university_db`.`instructor` (`instructor_ID`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE;	
  
ALTER TABLE `university_db`.`exam` 
ADD CONSTRAINT 
  FOREIGN KEY (`c_ID`)
  REFERENCES `university_db`.`course` (course_ID)
  ON DELETE NO ACTION
  ON UPDATE CASCADE;

ALTER TABLE `university_db`.`course` 
ADD CONSTRAINT 
  FOREIGN KEY (`academic_year`)
  REFERENCES `university_db`.`academic_year` (`year_ID`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE;

CREATE TABLE `university_db`.`student_year` (
  `s_ID` INT NOT NULL,
  `y_ID` INT NOT NULL,
  PRIMARY KEY (`s_ID`, `y_ID`),
  CONSTRAINT 
    FOREIGN KEY (`s_ID`)
    REFERENCES `university_db`.`student` (`student_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT 
    FOREIGN KEY (`y_ID`)
    REFERENCES `university_db`.`academic_year` (`year_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE `university_db`.`student_course` (
  `s_ID` INT NOT NULL,
  `c_ID` INT NOT NULL,
  PRIMARY KEY (`s_ID`, `c_ID`),
  CONSTRAINT 
    FOREIGN KEY (`s_ID`)
    REFERENCES `university_db`.`student` (`student_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT 
    FOREIGN KEY (`c_ID`)
    REFERENCES `university_db`.`course` (`course_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE `university_db`.`student_exam` (
  `s_ID` INT NOT NULL,
  `e_ID` INT NOT NULL,
  `grade` INT NULL,
  PRIMARY KEY (`s_ID`, `e_ID`),
  CONSTRAINT 
    FOREIGN KEY (`s_ID`)
    REFERENCES `university_db`.`student` (`student_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT 
    FOREIGN KEY (`e_ID`)
    REFERENCES `university_db`.`course` (`exam_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

ALTER TABLE `university_db`.`student_course` 
ADD COLUMN `total_degree` INT NULL AFTER `c_ID`,
ADD COLUMN `attended_lectures` INT NULL AFTER `total_degree`;

ALTER TABLE `university_db`.`student_exam` 
CHANGE COLUMN `grade` `degree` INT(11) NULL DEFAULT NULL ;

ALTER TABLE `university_db`.`user` 
ADD CONSTRAINT 
  FOREIGN KEY (`user_type`)
  REFERENCES `university_db`.`user_type` (`user_type_ID`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;