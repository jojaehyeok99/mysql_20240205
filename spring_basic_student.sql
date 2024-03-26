CREATE DATABASE basic;

USE basic;

DROP TABLE student;

CREATE TABLE student(
	student_number INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(20) NOT NULL,
    age INT NOT NULL,
    address TEXT NOT NULL,
    graduation BOOLEAN NOT NULL
);