/*
 Problem: Big Countries

 Approach:
 - Select name, population, and area from World
 - Filter countries where:
     area >= 3000000
     OR population >= 25000000

 Time Complexity: O(n)
*/

SELECT name, population, area
FROM World
WHERE area >= 3000000
   OR population >= 25000000;
