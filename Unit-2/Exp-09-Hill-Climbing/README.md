# Experiment 9: Hill Climbing

## Aim
To implement the Hill Climbing optimization algorithm in Prolog.

## Theory
Hill Climbing is a local search algorithm that repeatedly moves to a neighboring solution with a better value until no improvement is possible.

## Algorithm
1. Select a starting value.
2. Calculate its objective function value.
3. Check the left and right neighboring values.
4. Move to a neighbor if it gives a better value.
5. Repeat until no better neighbor exists.
6. Display the final solution and its value.

## Program
The program is provided in `hill_climbing.pl`.

## Sample Output
```text
Starting point: 0
Best value of X: 3
Maximum function value: 9
```

## Result
The Hill Climbing algorithm was implemented successfully using Prolog.

## Conclusion
Hill Climbing improves a solution step by step until it reaches a local optimum.