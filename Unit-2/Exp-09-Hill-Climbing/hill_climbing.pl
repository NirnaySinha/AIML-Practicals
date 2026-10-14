
% Objective function: f(X) = -(X - 3)^2 + 9
objective(X, Value) :-
    Value is -((X - 3) * (X - 3)) + 9.

% Find the best neighboring value
hill_climb(Current, Best) :-
    objective(Current, CurrentValue),
    Left is Current - 1,
    Right is Current + 1,
    objective(Left, LeftValue),
    objective(Right, RightValue),
    (
        LeftValue > CurrentValue ->
            hill_climb(Left, Best)
    ;
        RightValue > CurrentValue ->
            hill_climb(Right, Best)
    ;
        Best = Current
    ).

run :-
    Start = 0,
    hill_climb(Start, Best),
    objective(Best, Value),
    write('Starting point: '), write(Start), nl,
    write('Best value of X: '), write(Best), nl,
    write('Maximum function value: '), write(Value), nl.
