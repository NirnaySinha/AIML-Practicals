# Experiment 7: Greedy Best-First Search

## Aim
To implement Greedy Best-First Search using a heuristic function in Prolog.

## Theory
Greedy Best-First Search selects the path whose next node has the lowest heuristic value. It uses the estimated distance to the goal to decide which node to explore first.

## Algorithm
1. Define the graph and heuristic values.
2. Start from the initial node.
3. Select the path with the lowest heuristic value.
4. Expand the selected node and add its unvisited neighbors.
5. Repeat until the goal is reached.
6. Display the path.

## Program
The program is provided in `greedy_best_first.pl`.

## Sample Output
```text
Path: [a,b,d,g]
```

## Result
Greedy Best-First Search was implemented successfully using Prolog.

## Conclusion
The algorithm uses heuristic values to guide the search toward the goal.