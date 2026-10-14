
% Check whether a queen is safe from previously placed queens
safe(_, [], _).

safe(Col, [PrevCol|Rest], Distance) :-
    Col =\= PrevCol,
    abs(Col - PrevCol) =\= Distance,
    NextDistance is Distance + 1,
    safe(Col, Rest, NextDistance).

% Place queens row by row
solve_queens(Row, N, Board, Board) :-
    Row > N.

solve_queens(Row, N, Placed, Board) :-
    Row =< N,
    between(1, N, Col),
    safe(Col, Placed, 1),
    NextRow is Row + 1,
    solve_queens(NextRow, N, [Col|Placed], Board).

run :-
    N = 4,
    solve_queens(1, N, [], ReverseBoard),
    reverse(ReverseBoard, Board),
    write('Solution:'),
    nl,
    print_board(Board, 1, N).

% Display the chessboard
print_board([], _, _).

print_board([QueenCol|Rest], Row, N) :-
    print_row(1, N, QueenCol),
    nl,
    NextRow is Row + 1,
    print_board(Rest, NextRow, N).

print_row(Col, N, _) :-
    Col > N,
    !.

print_row(Col, N, QueenCol) :-
    (Col =:= QueenCol ->
        write('Q ')
    ;
        write('. ')
    ),
    NextCol is Col + 1,
    print_row(NextCol, N, QueenCol).
