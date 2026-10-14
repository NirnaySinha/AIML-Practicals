# Experiment 12: N-Queens using CSP and Backtracking

## Aim
To solve the N-Queens problem using CSP and backtracking in Prolog.

## Theory
The N-Queens problem requires placing N queens on an N × N chessboard so that no two queens attack each other.

- Variables: Rows of the chessboard.
- Domain: Possible columns for each queen.
- Constraints: No two queens can share the same column or diagonal.
- Backtracking: Removes a queen and tries another position when a conflict occurs.

## Algorithm
1. Initialize the chessboard size.
2. Place one queen in each row.
3. Check whether the selected column and diagonals are safe.
4. If the position is valid, proceed to the next row.
5. If no position works, backtrack and try another column.
6. Display the solution when all queens are placed.

## Program
The program is provided in `n_queens.pl`.

## Sample Output
```text
Solution:
. Q . .
. . . Q
Q . . .
. . Q .
```

## Result
The N-Queens problem was solved successfully using Prolog.

## Conclusion
Backtracking solves the N-Queens problem by checking constraints and trying alternative queen positions when necessary.