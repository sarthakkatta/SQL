/*
 Problem: Replace Employee ID With The Unique Identifier

 Approach:
 - Use LEFT JOIN to combine Employees and EmployeeUNI tables
 - Match records using id column
 - Retrieve unique_id and employee name
 - LEFT JOIN ensures all employees are included, even if unique_id is NULL

 Time Complexity: O(n log n)
*/

SELECT euni.unique_id, e.name
FROM Employees e
LEFT JOIN EmployeeUNI euni
ON e.id = euni.id;
