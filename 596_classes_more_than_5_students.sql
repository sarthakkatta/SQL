/*
 Problem: Classes More Than 5 Students

 Approach:
 - Group records by class
 - Count number of students in each class
 - Return classes with student count >= 5

 Time Complexity: O(n)
*/

SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(student) >= 5;
