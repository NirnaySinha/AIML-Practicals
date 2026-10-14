
:- use_module(library(random)).

objective(X, Value) :-
    Value is -((X - 3) * (X - 3)) + 10 * sin(2 * X).

simulated_annealing(Current, Temperature, BestSoFar, BestX) :-
    Temperature > 0.1,
    !,
    random_member(Step, [-1, 1]),
    Candidate is Current + Step,
    (
        (Candidate < -10 ; Candidate > 10)
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
        Random is random_float,
        (
            Random < Probability
        ->
            Updated = Next
        ;
            Updated = Current
        )
    ),
    objective(BestSoFar, BestValue),
    (
        NextValue > BestValue
    ->
        NewBest = Next
    ;
        NewBest = BestSoFar
    ),
    NewTemperature is Temperature * 0.95,
    simulated_annealing(
        Updated, NewTemperature, NewBest, BestX
    ).

simulated_annealing(_, _, Best, Best).

run :-
    Start = 0,
    Temperature = 10.0,
    simulated_annealing(Start, Temperature, Start, Best),
    objective(Best, Value),
    write('Starting point: '), write(Start), nl,
    write('Best value of X: '), write(Best), nl,
    write('Maximum function value: '),
    write(Value), nl.
