
:- use_module(library(random)).

% Objective function
objective(X, Value) :-
    Value is -((X - 3) * (X - 3)) + 10 * sin(2 * X).

% Simulated Annealing
simulated_annealing(Current, Temperature, Best, BestValue) :-
    Temperature > 0.1,
    !,
    random_member(Step, [-1, 1]),
    Candidate is Current + Step,
    (
        Candidate < -10 ; Candidate > 10
    ->
        Next = Current
    ;
        Next = Candidate
    ),
    objective(Current, CurrentValue),
    objective(Next, NextValue),
    Difference is NextValue - CurrentValue,
    (
        Difference > 0
    ->
        Updated = Next
    ;
        Probability is exp(Difference / Temperature),
        random_float(Random),
        (
            Random < Probability
        ->
            Updated = Next
        ;
            Updated = Current
        )
    ),
    objective(Best, OldBestValue),
    (
        NextValue > OldBestValue
    ->
        NewBest = Next
    ;
        NewBest = Best
    ),
    NewTemperature is Temperature * 0.95,
    simulated_annealing(
        Updated, NewTemperature, NewBest, BestValue
    ).

simulated_annealing(_, _, Best, BestValue) :-
    objective(Best, BestValue).

run :-
    Start = 0,
    Temperature = 10.0,
    simulated_annealing(Start, Temperature, Start, Best),
    objective(Best, Value),
    write('Starting point: '), write(Start), nl,
    write('Best value of X: '), write(Best), nl,
    write('Maximum function value: '),
    write(Value), nl.
