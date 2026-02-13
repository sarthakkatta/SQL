/*
 Problem: Not Boring Movies

 Approach:
 - Select all columns from Cinema
 - Filter movies where id is odd (id % 2 = 1)
 - Exclude movies with description = 'boring'
 - Sort results by rating in descending order

 Time Complexity: O(n log n)  -- due to ORDER BY
*/

SELECT *
FROM Cinema
WHERE id % 2 = 1
  AND description != 'boring'
ORDER BY rating DESC;
