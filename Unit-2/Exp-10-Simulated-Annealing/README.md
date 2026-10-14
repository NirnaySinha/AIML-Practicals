# Experiment 10: Simulated Annealing

## Aim
To implement the Simulated Annealing optimization algorithm in Prolog.

## Theory
Simulated Annealing is an optimization algorithm inspired by the cooling of heated materials. It sometimes accepts worse solutions to escape local optima. As the temperature decreases, the probability of accepting worse solutions also decreases.

## Algorithm
1. Select an initial solution and temperature.
2. Generate a neighboring solution.
3. Calculate the change in objective function value.
4. Accept a better solution or probabilistically accept a worse solution.
5. Update the best solution found so far.
6. Reduce the temperature and repeat until the stopping condition is reached.

## Program
The program is provided in `simulated_annealing.pl`.

## Sample Output
The program prints the starting point, best value of X found, and its objective function value. Results may vary because random choices are used.

## Result
The Simulated Annealing algorithm was implemented using Prolog.

## Conclusion
Simulated Annealing can explore different solutions and may escape local optima by accepting worse solutions during early iterations.