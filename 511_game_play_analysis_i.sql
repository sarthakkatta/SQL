/*
 Problem: Game Play Analysis I

 Approach:
 - Group records by player_id
 - Find the earliest event_date using MIN()
 - Rename it as first_login

 Time Complexity: O(n)
*/

SELECT player_id, MIN(event_date) AS first_login
FROM Activity
GROUP BY player_id;
