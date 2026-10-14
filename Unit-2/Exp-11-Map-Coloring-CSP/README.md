# Experiment 11: Map Coloring using CSP and Backtracking

## Aim
To solve the Map Coloring problem using Constraint Satisfaction Problem (CSP) and backtracking in Prolog.

## Theory
Map Coloring is a CSP problem in which adjacent regions must have different colors.

- Variables: Regions of the map.
- Domain: Red, Green, and Blue.
- Constraints: Neighboring regions cannot have the same color.
- Backtracking: Tries alternative colors when a constraint is violated.

## Algorithm
1. Define the available colors and neighboring regions.
2. Select a region and assign a color.
3. Check whether neighboring regions have different colors.
4. If the assignment is invalid, try another color.
5. Continue until all regions have been assigned valid colors.
6. Display the solution.

## Program
The program is provided in `map_coloring.pl`.

## Sample Output
```text
[wa-red,nt-green,sa-blue,q-red,nsw-green,v-red,t-red]
```

## Result
The Map Coloring problem was solved successfully using Prolog.

## Conclusion
Backtracking finds a valid map coloring by checking constraints between neighboring regions.