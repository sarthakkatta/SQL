/*
 Problem: Recyclable and Low Fat Products

 Approach:
 - Select product_id from Products
 - Filter products where low_fats = 'Y'
 - AND recyclable = 'Y'

 Time Complexity: O(n)
*/

SELECT product_id
FROM Products
WHERE low_fats = 'Y'
  AND recyclable = 'Y';
