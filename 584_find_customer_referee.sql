/*
 Problem: Find Customer Referee

 Approach:
 - Select customers whose referee_id is not 2
 - Include customers with NULL referee_id

 Time Complexity: O(n)
*/

SELECT name
FROM Customer
WHERE referee_id != 2
   OR referee_id IS NULL;
