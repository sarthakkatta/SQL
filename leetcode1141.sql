/*
Problem: LeetCode 1141 – User Activity for the Past 30 Days I

Approach:
1. Activity table se activity_date aur user_id chahiye.
2. Har date par kitne unique users active the,
   ye COUNT(DISTINCT user_id) se calculate karte hain.
3. WHERE condition se sirf required 30-day range
   ki activities select karte hain.
4. GROUP BY activity_date se har date ka separate group
   ban jaata hai.
5. COUNT(DISTINCT user_id) duplicate activities ko
   ignore karta hai.

Key Idea:
- Same user ek din mein multiple activities kar sakta hai,
  lekin usse sirf ek active user count karna hai.
- Isliye DISTINCT user_id use kiya hai.
- GROUP BY activity_date har day ka count separately deta hai.

Example:

Activity:
2019-07-01 → user 1
2019-07-01 → user 1
2019-07-01 → user 2
2019-07-02 → user 3

2019-07-01:
Unique users = 2

2019-07-02:
Unique users = 1

Output:
day        | active_users
2019-07-01 | 2
2019-07-02 | 1

Time Complexity: O(N)
Space Complexity: O(N)
*/

SELECT activity_date AS day, COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE (activity_date > "2019-06-27" AND activity_date <= "2019-07-27")
GROUP BY activity_date;
