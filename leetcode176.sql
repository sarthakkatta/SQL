/*
Problem: LeetCode 176 – Second Highest Salary

Approach:
1. Find the maximum salary in the Employee table.
2. Use a subquery to get that maximum salary.
3. Filter out the employee(s) having the highest salary:
      Salary < MAX(Salary)
4. From the remaining salaries, find the maximum salary.
5. This gives the second highest distinct salary.
6. If there is no second highest salary,
   MAX() returns NULL.

Key Idea:
- The inner query finds the highest salary.
- The outer MAX() finds the largest salary
  smaller than the highest salary.

Example:
Employee:

Salary
------
100
200
300

Inner query:
MAX(Salary) = 300

Remaining:
100, 200

Outer MAX:
200

Answer:
200

Time Complexity: O(N)
Space Complexity: O(1)
*/

SELECT MAX(Salary) AS SecondHighestSalary
FROM Employee
WHERE Salary < (
    SELECT MAX(Salary)
    FROM Employee
);
