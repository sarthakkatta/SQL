/*
 Problem: Average Selling Price (Including Products with No Sales)

 Approach:
 - Use LEFT JOIN to include all products from Prices table
 - Match purchase_date between start_date and end_date
 - Calculate weighted average price: SUM(price * units) / SUM(units)
 - Use IFNULL to return 0 if no units sold
 - Group result by product_id

 Time Complexity: O(n log n)
*/

SELECT 
    p.product_id,
    ROUND(IFNULL(SUM(p.price * u.units) / SUM(u.units), 0), 2) AS average_price
FROM Prices p
LEFT JOIN UnitsSold u
ON p.product_id = u.product_id
AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY p.product_id;
