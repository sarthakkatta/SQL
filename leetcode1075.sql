/*
Problem: LeetCode 1075 – Project Employees I

Approach:
1. Project table mein har project ke saath employee_id diya hai.
2. Employee table se employee ki experience_years nikalni hai.
3. Dono tables ko employee_id ke basis par JOIN karte hain.
4. Har project ke liye employees ki experience ka average
   calculate karte hain using AVG().
5. GROUP BY project_id se har project ka separate group banega.
6. ROUND(..., 2) average ko 2 decimal places tak round karta hai.

Key Idea:
- JOIN → Project ko Employee ke saath connect karta hai.
- AVG(experience_years) → project ke employees ka average experience.
- GROUP BY project_id → har project ka alag average.
- ROUND(..., 2) → answer ko 2 decimal places mein deta hai.

Example:

Project:
project_id | employee_id
1          | 101
1          | 102
2          | 103

Employee:
employee_id | experience_years
101         | 3
102         | 5
103         | 2

Project 1:
(3 + 5) / 2 = 4.00

Project 2:
2 / 1 = 2.00

Output:
project_id | average_years
1           | 4.00
2           | 2.00

Time Complexity: O(N)
Space Complexity: O(N)
*/

SELECT p.project_id,
       ROUND(AVG(e.experience_years), 2) AS average_years
FROM Project p
JOIN Employee e
    ON p.employee_id = e.employee_id
GROUP BY p.project_id;
