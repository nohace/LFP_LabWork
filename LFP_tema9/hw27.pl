% exercise 27

bsort1([X], [X]).
bsort1([X, Y|T], Out) :- X =< Y, bsort1([Y|T], Rest), Out = [X|Rest].
bsort1([X, Y|T], [Y|Rest]) :- X > Y, bsort1([X|T], Rest).
