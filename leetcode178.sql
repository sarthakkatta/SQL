/*
Problem: LeetCode 178 – Rank Scores

Approach:
1. Select the Score column from the Scores table.
2. Use the DENSE_RANK() window function to assign
   a rank to every score.
3. Sort scores in descending order:
      ORDER BY Score DESC
4. Scores with the same value receive the same rank.
5. DENSE_RANK() does not leave gaps between ranks.

Example:
Scores:
100
90
90
80

Ranking:
100 → 1
90  → 2
90  → 2
80  → 3

Key Idea:
- DENSE_RANK() gives the same rank to duplicate scores.
- Unlike RANK(), it does not skip a rank after duplicates.

Time Complexity: O(N log N)
Space Complexity: O(N)
*/

SELECT Score,

DENSE_RANK() OVER(ORDER BY Score DESC) AS `rank`

FROM Scores;
