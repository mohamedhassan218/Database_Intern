CREATE SCHEMA `university_database` ;

CREATE TABLE `university_database`.`user_type` (
  `user_type_ID` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(45) NULL,
  PRIMARY KEY (`user_type_ID`),
  UNIQUE INDEX `type_UNIQUE` (`type` ASC));

CREATE TABLE `university_database`.`user` (
  `user_ID` INT NOT NULL AUTO_INCREMENT,
  `user_email` VARCHAR(70) NULL,
  `user_password` VARCHAR(50) NULL,
  `user_type` INT NULL,
  PRIMARY KEY (`user_ID`),
  UNIQUE INDEX `user_email_UNIQUE` (`user_email` ASC));

CREATE TABLE `university_database`.`department` (
  `iddepartment` INT NOT NULL AUTO_INCREMENT,
  `department_name` VARCHAR(100) NULL,
  `number_of_students` INT NULL,
  PRIMARY KEY (`iddepartment`),
  UNIQUE INDEX `department_name_UNIQUE` (`department_name` ASC));
ALTER TABLE `university_database`.`department` 
CHANGE COLUMN `iddepartment` `department_ID` INT(11) NOT NULL AUTO_INCREMENT ;

CREATE TABLE `university_database`.`student` (
  `student_ID` INT NOT NULL AUTO_INCREMENT,
  `student_name` VARCHAR(300) NULL,
  `mobile_number` VARCHAR(20) NULL,
  `profile_photo` BLOB NULL,
  `student_email` VARCHAR(60) NULL,
  `date_of_birth` DATE NULL,
  `age` INT NULL,
  `gender` VARCHAR(10) NULL,
  `d_ID` INT NULL,
  PRIMARY KEY (`student_ID`),
  UNIQUE INDEX `student_email_UNIQUE` (`student_email` ASC));

CREATE TABLE `university_database`.`instructor` (
  `instructor_ID` INT NOT NULL AUTO_INCREMENT,
  `instructor_name` VARCHAR(300) NULL,
  `instructor_email` VARCHAR(60) NULL,
  `phone_number` VARCHAR(20) NULL,
  `specialty` VARCHAR(150) NULL,
  `room_number` INT NULL,
  `office_hours` VARCHAR(400) NULL,
  `type` VARCHAR(50) NULL,
  `d_ID` INT NULL,
  PRIMARY KEY (`instructor_ID`),
  UNIQUE INDEX `instructor_email_UNIQUE` (`instructor_email` ASC));

CREATE TABLE `university_database`.`academic_year` (
  `year_ID` INT NOT NULL AUTO_INCREMENT,
  `year` VARCHAR(80) NULL,
  PRIMARY KEY (`year_ID`),
  UNIQUE INDEX `year_UNIQUE` (`year` ASC));

CREATE TABLE `university_database`.`exam` (
  `exam_ID` INT NOT NULL AUTO_INCREMENT,
  `exam_name` VARCHAR(200) NULL,
  `exam_date` DATE NULL,
  `start_time` TIME NULL,
  `end_time` TIME NULL,
  `duration` INT NULL,
  `number_of_questions` INT NULL,
  `degree` INT NULL,
  `type` VARCHAR(10) NULL,
  `c_ID` INT NULL,
  PRIMARY KEY (`exam_ID`));

CREATE TABLE `university_database`.`gpa` (
  `gpa_ID` INT NOT NULL AUTO_INCREMENT,
  `grades_from` INT NULL,
  `grades_less` INT NULL,
  `grade` VARCHAR(5) NULL,
  PRIMARY KEY (`gpa_ID`));

CREATE TABLE `university_database`.`course` (
  `course_ID` INT NOT NULL AUTO_INCREMENT,
  `course_name` VARCHAR(150) NULL,
  `lectures_number` INT NULL,
  `minimum_lectures` INT NULL,
  `d_ID` INT NULL,
  `i_ID` INT NULL,
  `academic_year` INT NULL,
  PRIMARY KEY (`course_ID`),
  UNIQUE INDEX `course_name_UNIQUE` (`course_name` ASC));