
:- use_module(library(pairs)).

edge(a, b).
edge(a, c).
edge(b, d).
edge(c, e).
edge(d, g).
edge(e, g).

h(a, 5).
h(b, 3).
h(c, 4).
h(d, 1).
h(e, 2).
h(g, 0).

greedy(Start, Goal, Path) :-
    greedy_search([[Start]], Goal, RevPath),
    reverse(RevPath, Path).

greedy_search([[Goal|Rest]|_], Goal, [Goal|Rest]).

greedy_search([[Node|Rest]|Queue], Goal, Path) :-
    findall(
        [Next,Node|Rest],
        (edge(Node, Next), \+ member(Next, [Node|Rest])),
        NewPaths
    ),
    append(Queue, NewPaths, AllPaths),
    sort_paths(AllPaths, SortedPaths),
    greedy_search(SortedPaths, Goal, Path).

sort_paths(Paths, Sorted) :-
    map_list_to_pairs(path_heuristic, Paths, Pairs),
    keysort(Pairs, SortedPairs),
    pairs_values(SortedPairs, Sorted).

path_heuristic([Node|_], H) :-
    h(Node, H).

run :-
    greedy(a, g, Path),
    write('Path: '),
    write(Path),
    nl.
