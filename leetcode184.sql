/*
Problem: LeetCode 184 – Department Highest Salary

Approach:
1. JOIN Employee and Department tables to get
   the department name.
2. For every employee, use a correlated subquery
   to find the maximum salary of that employee's
   department.
3. Compare the employee's salary with that
   department maximum salary.
4. If they are equal, the employee has the
   highest salary in that department.
5. Since multiple employees can have the same
   highest salary, all of them will be returned.

Key Idea:
- The subquery depends on the current employee:
      departmentId = e.departmentId
- Therefore, it finds the maximum salary separately
  for each department.

Example:

Employee:
Alice   90000   1
Bob    100000   1
Charlie 80000   2
David  120000   2

Department:
1 → IT
2 → Sales

Maximum salaries:
IT    → 100000
Sales → 120000

Output:
IT     | Bob   | 100000
Sales  | David | 120000

Time Complexity: O(N²) in the general case
Space Complexity: O(1)
*/

SELECT d.name AS Department,
       e.name AS Employee,
       e.salary AS Salary

FROM Employee e

JOIN Department d
    ON e.departmentId = d.id

WHERE e.salary = (
    SELECT MAX(salary)
    FROM Employee
    WHERE departmentId = e.departmentId
);
