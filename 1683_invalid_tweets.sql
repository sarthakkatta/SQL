/*
 Problem: Invalid Tweets

 Approach:
 - Select tweet_id from Tweets
 - Filter tweets where content length > 15 characters

 Time Complexity: O(n)
*/

SELECT tweet_id
FROM Tweets
WHERE LENGTH(content) > 15;
