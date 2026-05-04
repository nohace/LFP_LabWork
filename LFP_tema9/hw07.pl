% exercise 7

sumlist([], 0).
sumlist([H|T], S) :- sumlist(T, St), S is H + St.

lenlist([], 0).
lenlist([_|T], N) :- lenlist(T, M), N is M + 1.

avg_mean(L, M) :- sumlist(L, S), lenlist(L, N), N > 0, M is S / N.
