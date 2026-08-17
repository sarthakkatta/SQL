/*
Problem: LeetCode 626 – Exchange Seats

Approach:
1. Seat table mein students ko adjacent seats ke saath
   swap karna hai.
2. Odd ID:
   - Agar next seat exist karti hai,
     to id + 1 kar do.
3. Even ID:
   - Previous odd seat ke saath swap karne ke liye
     id - 1 kar do.
4. Last odd seat ko swap nahi karna hai agar uske baad
   koi seat exist nahi karti.
5. CASE statement se har row ki new ID calculate karte hain.
6. ORDER BY id se final result correct seat order mein aata hai.

Key Idea:
- Odd seat → next even seat.
- Even seat → previous odd seat.
- Last odd seat → same ID.
- CASE conditions ke through swapping handle hoti hai.

Example:

Original:
id | student
1  | Abbot
2  | Doris
3  | Emerson
4  | Green
5  | Jeames

After Swap:
1 → Doris
2 → Abbot
3 → Green
4 → Emerson
5 → Jeames

Output:
id | student
1  | Doris
2  | Abbot
3  | Green
4  | Emerson
5  | Jeames

Time Complexity: O(N log N)
Space Complexity: O(1)
*/

# Write your MySQL query statement below
SELECT
    CASE
        WHEN id % 2 = 1 AND id < (SELECT MAX(id) FROM Seat)
            THEN id + 1
        WHEN id % 2 = 0
            THEN id - 1
        ELSE id
    END AS id,
    student
FROM Seat
ORDER BY id;
