/*
Problem: LeetCode 185 – Department Top Three Salaries

Approach:
1. Employee table ke andar DENSE_RANK() use karte hain.
2. PARTITION BY departmentId se har department ka
   salary ranking separately hota hai.
3. ORDER BY salary DESC se highest salary ko rank 1
   milta hai.
4. DENSE_RANK() same salary wale employees ko same rank
   deta hai.
5. Subquery ke result ko Department table ke saath JOIN
   karke department ka name nikalte hain.
6. WHERE e.rnk <= 3 se har department ke top 3
   distinct salary ranks select karte hain.

Key Idea:
- PARTITION BY → har department ka separate ranking.
- DENSE_RANK() → duplicate salaries ko same rank.
- rnk <= 3 → top 3 salaries.
- Agar same salary ke multiple employees hain,
  to sabhi employees return honge.

Example:

Department: IT

Employee | Salary
A        | 100000
B        | 90000
C        | 90000
D        | 80000
E        | 70000

Ranks:
100000 → 1
90000  → 2
90000  → 2
80000  → 3
70000  → 4

rnk <= 3:
A, B, C, D

Time Complexity: O(N log N)

Space Complexity: O(N)
*/

SELECT
    d.name AS Department,
    e.name AS Employee,
    e.salary AS Salary
FROM (
    SELECT
        name,
        salary,
        departmentId,
        DENSE_RANK() OVER (
            PARTITION BY departmentId
            ORDER BY salary DESC
        ) AS rnk
    FROM Employee
) e
JOIN Department d
    ON e.departmentId = d.id
WHERE e.rnk <= 3;
