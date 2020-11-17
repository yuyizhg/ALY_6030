-- create table Courses as
-- select course_id, Course_Short_title, Course_Long_Title
-- from Project3

-- create table Users as
-- select userid_DI, registered, viewed, explored, certified, Country, LoE_DI, YoB, Age, gender
-- from Project3

-- create table Course_Users as
-- select userid_DI, course_id, grade, nevents, ndays_act, nplay_video, nchapters, nforum_posts, roles, incomplete_flag
-- from Project3



-- with fall as (SELECT cu.userid_DI as uid
-- FROM Users u LEFT JOIN Course_Users cu ON u.userid_DI = cu.userid_DI
-- WHERE cu.course_number = '6.00x'
-- AND cu.course_term = '2012_Fall') ,

-- spring as (SELECT cu.userid_DI as uid
-- FROM Users u LEFT JOIN Course_Users cu ON u.userid_DI = cu.userid_DI
-- WHERE cu.course_number = '6.00x'
-- AND cu.course_term = '2013_Spring') 

-- SELECT count(*) FROM fall INNER JOIN spring ON fall.uid = spring.uid;


-- 3.1

-- WITH t1 as (SELECT COUNT(DISTINCT cu.userid_DI) as Enrollees, cu.course_number
-- FROM Course_Users cu
-- GROUP BY cu.course_number
-- ORDER BY enrollees DESC),

-- t2 as (select distinct course_number, course_long_title from Courses)

-- SELECT enrollees, t2.course_long_title
-- FROM t1 LEFT JOIN t2 ON t1.course_number = t2.course_number
-- ORDER BY enrollees DESC;


-- 3.2

-- WITH T1 AS (SELECT COUNT(DISTINCT cu.userid_DI) as Enrollees, cu.course_id
-- FROM Course_Users cu
-- GROUP BY cu.course_id
-- ORDER BY enrollees DESC)

-- SELECT *
-- FROM T1
-- WHERE Enrollees > 4000;


-- 4.1

-- SELECT course_id, COUNT(userid_DI) as 'cerfitied'
-- FROM Courses_Users 
-- WHERE certified = 1
-- GROUP BY course_id;


-- 4.2

-- WITH t1 as (SELECT course_number, COUNT(userid_DI) as certified
-- FROM Course_Users
-- WHERE certified = 1
-- GROUP BY course_number),

-- t2 as (SELECT DISTINCT course_number, course_long_title FROM Courses)

-- SELECT t2.course_long_title, t1.certified
-- FROM t2 LEFT JOIN t1 on t2.course_number = t1.course_number
-- ORDER BY certified DESC;


-- 4.3

-- WITH T1 AS (SELECT course_id, COUNT(userid_DI) as 'registered'
-- FROM Courses_Users 
-- WHERE registered = 1
-- GROUP BY course_id),

-- T2 AS (SELECT course_id, COUNT(userid_DI) as 'certified'
-- FROM Courses_Users 
-- WHERE certified = 1
-- GROUP BY course_id)

-- SELECT T1.course_id, T1.registered, T2.certified, (1 - T2.certified / T1.registered) * 100 as percentage
-- FROM T1 LEFT JOIN T2 ON T1.course_id = T2.course_id;


-- 4.4

WITH t1 as (SELECT course_number, COUNT(userid_DI) as registered
FROM Course_Users
WHERE registered = 1
GROUP BY course_number),

t2 as (SELECT course_number, COUNT(userid_DI) as certified
FROM Course_Users
WHERE certified = 1
GROUP BY course_number),

t3 as (SELECT DISTINCT course_number, course_long_title FROM Courses)

SELECT t3.course_long_title, t1.registered, t2.certified, (1-t2.certified/t1.registered) * 100 as percentage
FROM t1 LEFT JOIN t2 on t1.course_number = t2.course_number
LEFT JOIN t3 on t1.course_number = t3.course_number;







-- 5.1
-- WITH T1 AS (SELECT course_id, COUNT(userid_DI) AS Enrollees
-- FROM Courses_Users
-- WHERE institution = 'HarvardX'
-- GROUP BY course_id)

-- SELECT *
-- FROM T1
-- WHERE Enrollees > 4000;


-- 5.2
-- WITH T1 AS (SELECT userid_DI, count(course_id) AS Enrollees
-- FROM Courses_Users
-- GROUP BY userid_DI)

-- SELECT *
-- FROM T1
-- WHERE Enrollees > 3


-- 5.3
-- SELECT Country, COUNT(userid_DI)
-- FROM Users
-- GROUP BY Country
-- ORDER BY Country;


-- 5.4
-- SELECT u.Country, AVG(cu.grade) as avg_grade
-- FROM Users u LEFT JOIN Courses_Users cu ON u.userid_DI = cu.userid_DI
-- WHERE u.certified = 1
-- GROUP BY Country
-- ORDER BY avg_grade DESC;


-- 6.1
-- SELECT u.Country, AVG(cu.grade) as avg_grade
-- FROM Users u LEFT JOIN Courses_Users cu ON u.userid_DI = cu.userid_DI
-- WHERE u.certified = 1
-- AND institution = 'HarvardX'
-- GROUP BY Country
-- ORDER BY avg_grade DESC;


-- 6.3
-- SELECT u.Country, AVG(cu.grade) as avg_grade
-- FROM Users u LEFT JOIN Courses_Users cu ON u.userid_DI = cu.userid_DI
-- WHERE u.certified = 1
-- AND institution = 'MITx'
-- GROUP BY Country
-- ORDER BY avg_grade DESC;





