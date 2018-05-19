# ExamSystem-bash
Simple exam system using bash scripting.

To use the system correctly you should :

# DataBase

1. import the database
	  mysql -uroot -p examsystem < examsystem.sql

2. Create new user (name = newuser  ,  with no password )

    CREATE USER 'new_user'@'localhost' IDENTIFIED BY '';
    GRANT ALL ON examsystem.* TO 'new_user'@'localhost';

# Using the system

1. run script which is called (mainmenu.sh)
2. sign up as new user
3. login to start the exam
4. choose number of question that you want
5. finish the exam to save result of this exam in database

# The Report

1. login as admin (admin name = admin  , password = admin)
2. there are report for each level of questions (easy , medium , hard)
3. there is report of exams which users had  
