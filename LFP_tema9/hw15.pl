% exercise 15

delete_nth(_, N, _) :- N =< 0, !, fail.
delete_nth(L, N, R) :- N > 0, dn(L, N, 1, R).

dn([], _, _, []).
dn([_|T], N, P, R) :- P mod N =:= 0, P1 is P + 1, dn(T, N, P1, R).
dn([H|T], N, P, [H|R]) :- P mod N =\= 0, P1 is P + 1, dn(T, N, P1, R).
