# Experiment 8: A* Search Algorithm

## Aim
To implement the A* Search algorithm using path cost and heuristic values in Prolog.

## Theory
A* Search selects paths using both the actual cost from the starting node and the estimated cost to the goal.

**Evaluation function:**

`f(n) = g(n) + h(n)`

- `g(n)` is the actual cost from the start.
- `h(n)` is the estimated cost to the goal.
- `f(n)` is the total estimated cost.

## Algorithm
1. Define the weighted graph and heuristic values.
2. Start with the initial node and cost zero.
3. Calculate the evaluation value for each neighboring node.
4. Select the path with the lowest evaluation value.
5. Continue until the goal is reached.
6. Display the path and its total cost.

## Program
The program is provided in `a_star.pl`.

## Sample Output
```text
Path: [a,c,e,g]
Cost: 7
```

## Result
The A* Search algorithm was implemented successfully using Prolog.

## Conclusion
A* Search combines actual path cost and heuristic estimates to find an optimal path when the heuristic satisfies the required conditions.