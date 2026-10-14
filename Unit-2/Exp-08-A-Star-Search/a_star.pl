
:- use_module(library(pairs)).

% Weighted graph connections
connection(a, b, 1).
connection(a, c, 4).
connection(b, d, 2).
connection(b, e, 5).
connection(c, e, 1).
connection(d, g, 5).
connection(e, g, 2).

% Treat connections as bidirectional
edge(X, Y, Cost) :-
    connection(X, Y, Cost).
edge(X, Y, Cost) :-
    connection(Y, X, Cost).

% Heuristic values
h(a, 5).
h(b, 5).
h(c, 3).
h(d, 4).
h(e, 2).
h(g, 0).

% A* Search
a_star(Start, Goal, Path, Cost) :-
    h(Start, H),
    a_star_search([node(H, 0, [Start])], Goal, RevPath, Cost),
    reverse(RevPath, Path).

a_star_search([node(_, Cost, [Goal|Rest])|_],
              Goal, [Goal|Rest], Cost).

a_star_search([node(_, Cost, [Current|Rest])|Queue],
              Goal, Path, FinalCost) :-
    findall(
        node(F, NewCost, [Next,Current|Rest]),
        (
            edge(Current, Next, StepCost),
            \+ member(Next, [Current|Rest]),
            NewCost is Cost + StepCost,
            h(Next, H),
            F is NewCost + H
        ),
        NewNodes
    ),
    append(Queue, NewNodes, AllNodes),
    sort_nodes(AllNodes, SortedNodes),
    a_star_search(SortedNodes, Goal, Path, FinalCost).

sort_nodes(Nodes, Sorted) :-
    map_list_to_pairs(node_priority, Nodes, Pairs),
    keysort(Pairs, SortedPairs),
    pairs_values(SortedPairs, Sorted).

node_priority(node(F, _, _), F).

run :-
    a_star(a, g, Path, Cost),
    write('Path: '),
    write(Path),
    nl,
    write('Cost: '),
    write(Cost),
    nl.
