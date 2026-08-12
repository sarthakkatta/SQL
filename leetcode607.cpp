/*
Problem: LeetCode 607 – Sales Person

Approach:
1. Start with all salespersons from the SalesPerson table.
2. Use a subquery to find salespersons who have
   an order with the company named 'Red'.
3. Use `NOT IN` in the outer query to exclude
   those salespersons.
4. The remaining salespersons are those who
   have never made an order for the company 'Red'.

Key Idea:
- Inner query:
      Finds salespersons associated with Red.
- Outer query:
      Returns everyone whose name is NOT in
      that list.

Tables:

SalesPerson
- sales_id
- name

Orders
- order_id
- com_id
- sales_id

Company
- com_id
- name

Example:

SalesPerson:
Alice
Bob
Charlie

Orders:
Alice → Red
Bob → Blue

Result:
Bob
Charlie

Time Complexity: O(N + M)
Space Complexity: O(N)
*/

SELECT s.name
FROM SalesPerson s
WHERE s.name NOT IN (

    SELECT s.name
    FROM SalesPerson s

    LEFT JOIN Orders o
        ON s.sales_id = o.sales_id

    LEFT JOIN Company c
        ON o.com_id = c.com_id

    WHERE c.name = 'Red'
);
