/*
Problem: LeetCode 177 – Nth Highest Salary

Approach:
1. Create a MySQL function `getNthHighestSalary`.
2. The function receives N, representing the required
   salary rank.
3. Convert N into a zero-based offset:
      N = N - 1
4. Select distinct salaries because duplicate salaries
   should have the same rank.
5. Sort salaries in descending order:
   - Highest salary comes first.
6. Use:
      LIMIT 1 OFFSET N
   to select the Nth highest distinct salary.
7. If the requested salary does not exist,
   the query returns NULL.

Key Idea:
- DISTINCT removes duplicate salaries.
- ORDER BY Salary DESC arranges salaries from
  highest to lowest.
- OFFSET skips the previous salaries.
- LIMIT 1 returns exactly one salary.

Example:
Salaries:
100
300
200
300

Distinct descending:
300
200
100

getNthHighestSalary(2):
N becomes 1

OFFSET 1 → skips 300
Answer → 200

Time Complexity: O(N log N)
Space Complexity: O(N)
*/

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN

    SET N = N - 1;

    RETURN (

        SELECT DISTINCT(Salary)
        FROM Employee
        ORDER BY Salary DESC
        LIMIT 1 OFFSET N

    );

END
