/*
Problem: LeetCode 1327 – List the Products Ordered in a Period

Approach:
1. Products aur Orders tables ko product_id ke basis par JOIN karte hain.
2. WHERE condition se sirf February 2020 ke orders select karte hain.
3. GROUP BY product_name se har product ka separate group banate hain.
4. SUM(o.unit) se February mein us product ke total ordered
   units calculate karte hain.
5. HAVING SUM(o.unit) >= 100 se sirf wahi products select
   karte hain jinke at least 100 units ordered hue hain.

Key Idea:
- WHERE → pehle February ke orders filter karta hai.
- GROUP BY → har product ka group banata hai.
- SUM() → total units calculate karta hai.
- HAVING → grouped result par condition lagata hai.

Example:

Product A:
Feb 1 → 40 units
Feb 10 → 30 units
Feb 20 → 40 units

Total = 110

→ Product A included.

Product B:
Feb 5 → 60 units
Feb 15 → 20 units

Total = 80

→ Product B excluded.

Time Complexity: O(N)

Space Complexity: O(N)
*/

SELECT p.product_name, SUM(o.unit) unit
FROM Products p
JOIN Orders o
ON p.product_id = o.product_id
WHERE order_date BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY p.product_name
HAVING SUM(o.unit) >= 100
