/*
1. Write an SQL query to retrieve the name and age of all students who are older than 20.

2. Write an SQL query to list all the distinct batch names from the campus table, sorted alphabetically.

3. Write an SQL query to find the average score for each assignment across all students. The result should include the assignment_name and the average score.

4. Write an SQL query to list the campus_name where the average total_grade of students is above 85. Include the average total_grade in your result.
*/

-- SQL query to retrieve the name and age of all students who are older than 20.
SELECT s.name, s.age 
FROM students s
WHERE age > 20;

-- SQL query to list all the distinct batch names from the campus table, sorted alphabetically.
SELECT DISTINCT s.batch 
FROM campus s
ORDER BY batch ASC

-- SQL query to find the average score for each assignment across all students. The result should include the assignment_name and the average score.
SELECT b.assignment_name, AVG(a.score) AS average_score
FROM assignment_scores a
INNER JOIN assignments b ON a.assignment_id = b.id
GROUP BY b.assignment_name
ORDER BY b.assignment_name ASC;

-- SQL query to list the campus_name where the average total_grade of students is above 85. Include the average total_grade in your result.
SELECT campus_id, AVG(total_grade) AS average_grade
FROM students
GROUP BY campus_id
HAVING AVG(total_grade) > 85;
