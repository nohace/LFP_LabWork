% exercise 25

delElem([], _, []).
delElem([H|T], E, R) :- H == E, delElem(T, E, R).
delElem([H|T], E, [H|R]) :- H \== E, delElem(T, E, R).
