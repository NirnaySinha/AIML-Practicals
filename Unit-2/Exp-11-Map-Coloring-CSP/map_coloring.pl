
% Available colors
color(red).
color(green).
color(blue).

% Neighboring regions
neighbor(wa, nt).
neighbor(wa, sa).
neighbor(nt, sa).
neighbor(nt, q).
neighbor(sa, q).
neighbor(sa, nsw).
neighbor(sa, v).
neighbor(q, nsw).
neighbor(nsw, v).

% Treat neighboring relations as bidirectional
adjacent(X, Y) :- neighbor(X, Y).
adjacent(X, Y) :- neighbor(Y, X).

% Check that adjacent regions have different colors
valid_color(_, [], _).
valid_color(Region, [Other-OtherColor|Rest], Color) :-
    (adjacent(Region, Other) ->
        Color \= OtherColor
    ;
        true
    ),
    valid_color(Region, Rest, Color).

% Assign a color to each region
map_coloring([], []).
map_coloring([Region|Rest], [Region-Color|Assignment]) :-
    map_coloring(Rest, Assignment),
    color(Color),
    valid_color(Region, Assignment, Color).

run :-
    Regions = [wa, nt, sa, q, nsw, v, t],
    map_coloring(Regions, Assignment),
    write(Assignment),
    nl.
