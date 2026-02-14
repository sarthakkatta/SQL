/*
 Problem: Article Views I

 Approach:
 - Select DISTINCT author_id and rename it as id
 - Filter rows where author_id = viewer_id
 - Sort the result by id

 Time Complexity: O(n log n)  -- due to DISTINCT and ORDER BY
*/

SELECT DISTINCT author_id AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY id;
