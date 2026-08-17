/*
Problem: LeetCode 3090 – Maximum Length Substring With Two Occurrences

Approach:
1. Use Sliding Window with two pointers:
   - i → left side of the window
   - j → right side of the window
2. Use an unordered_map to store the frequency
   of each character inside the current window.
3. Move j forward and add s[j] to the window.
4. If the frequency of s[j] becomes greater than 2:
   - The current window becomes invalid.
   - Move i forward.
   - Decrease the frequency of s[i].
5. Continue shrinking until every character appears
   at most 2 times.
6. For every valid window, calculate its length:
      j - i + 1
7. Keep the maximum length in res.

Key Idea:
- The window always contains every character
  at most twice.
- Whenever any character appears 3 times,
  move the left pointer until the window becomes valid.
- Since both pointers only move forward,
  each character is processed at most twice.

Example:

s = "bcbbbcba"

A valid longest substring can contain
each character at most 2 times.

Longest valid substring:
"bcbb"

Length = 4

Answer:
4

Time Complexity: O(N)

Space Complexity: O(N)
*/

class Solution {
public:
    int maximumLengthSubstring(string s) {
        unordered_map<char, int> m;
        int i = 0, j = 0;
        int n = s.size();
        int res = 0;    
        while (j < n) {
            m[s[j]]++;
            while (m[s[j]] > 2) {
                m[s[i]]--;
                i++;
            }
            res = max(res, j - i + 1);
            j++;
        }
        return res;
    }
};
