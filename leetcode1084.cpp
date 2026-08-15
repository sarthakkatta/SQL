/*
Problem: LeetCode 1084 – Sales Analysis III

Approach:
1. Product aur Sales tables ko product_id ke basis par JOIN karte hain.
2. GROUP BY se har product ka ek group banate hain.
3. Har product ki:
   - MIN(sale_date) → earliest sale date
   - MAX(sale_date) → latest sale date
4. HAVING mein check karte hain ki:
   - Earliest sale 2019-01-01 ya uske baad ho.
   - Latest sale 2019-03-31 ya usse pehle ho.
5. Iska matlab product ki saari sales given date range
   ke andar hui hain.
6. Jo products condition satisfy karte hain, unka
   product_id aur product_name return karte hain.

Key Idea:
- MIN() earliest sale find karta hai.
- MAX() latest sale find karta hai.
- Agar earliest aur latest dono date range ke andar hain,
  to product ki saari sales bhi usi range ke andar hongi.

Example:

Product A:
2019-01-10
2019-02-15
2019-03-20

MIN = 2019-01-10
MAX = 2019-03-20

→ Valid

Product B:
2019-02-10
2019-04-05

MAX = 2019-04-05

→ Invalid

Time Complexity: O(N log N)
Space Complexity: O(N)
*/

SELECT p.product_id, p.product_name
FROM Product p
JOIN Sales s
    ON p.product_id = s.product_id
GROUP BY p.product_id, p.product_name
HAVING MIN(s.sale_date) >= '2019-01-01'
   AND MAX(s.sale_date) <= '2019-03-31';
