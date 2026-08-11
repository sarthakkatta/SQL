/*
Problem: LeetCode 197 – Rising Temperature

Approach:
1. Use the Weather table twice:
   - w1 → current day
   - w2 → previous day
2. Compare the dates using DATEDIFF().
3. The condition:
      DATEDIFF(w1.recordDate, w2.recordDate) = 1
   ensures that w1 is exactly one day after w2.
4. Compare their temperatures:
      w1.temperature > w2.temperature
5. If today's temperature is higher than the
   previous day's temperature, return w1.id.

Key Idea:
- Self-join allows us to compare temperatures
  of two different rows in the same table.
- DATEDIFF ensures that we compare only
  consecutive dates.

Example:

id | recordDate | temperature
1  | 2015-01-01 | 10
2  | 2015-01-02 | 25
3  | 2015-01-03 | 20

For id = 2:
25 > 10 → Yes

For id = 3:
20 > 25 → No

Answer:
2

Time Complexity: O(N²) in the general case
Space Complexity: O(1)
*/

SELECT w1.id
FROM Weather w1, Weather w2
WHERE DATEDIFF(w1.recordDate, w2.recordDate) = 1
  AND w1.temperature > w2.temperature;
