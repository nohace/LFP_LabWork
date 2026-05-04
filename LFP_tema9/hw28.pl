% exercise 28

bsort1([X], [X]).
bsort1([X, Y|T], Out) :- X =< Y, bsort1([Y|T], Rest), Out = [X|Rest].
bsort1([X, Y|T], [Y|Rest]) :- X > Y, bsort1([X|T], Rest).

bsort(L, S) :- length(L, N), (N =< 1 -> S = L ; N1 is N - 1, manypass(L, N1, S)).

manypass(L, 0, L).
manypass(L, K, S) :- K > 0, bsort1(L, L1), K1 is K - 1, manypass(L1, K1, S).
