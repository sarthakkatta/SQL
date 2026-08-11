/*
Problem: LeetCode 180 – Consecutive Numbers

Approach:
1. Join the Logs table with itself three times:
   - l1 → first occurrence
   - l2 → second consecutive occurrence
   - l3 → third consecutive occurrence
2. Use the Id column to ensure the records are consecutive:
      l2.Id = l1.Id + 1
      l3.Id = l1.Id + 2
3. Check that all three values are equal:
      l1.Num = l2.Num
      l2.Num = l3.Num
4. Use DISTINCT so that the same number is returned
   only once even if it appears in multiple
   consecutive groups.

Key Idea:
- Self-join allows us to compare three consecutive
  rows of the Logs table.
- A number is valid only when it appears in
  three consecutive records.

Example:
Id   Num
1    1
2    1
3    1
4    2

The number 1 appears three times consecutively,
so the answer is:

1

Time Complexity: O(N)
Space Complexity: O(N)
*/

SELECT DISTINCT l1.Num AS ConsecutiveNums

FROM Logs l1

JOIN Logs l2
    ON l2.Id = l1.Id + 1

JOIN Logs l3
    ON l3.Id = l1.Id + 2

WHERE l1.Num = l2.Num
  AND l2.Num = l3.Num;
