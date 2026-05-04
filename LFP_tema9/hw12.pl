% exercise 12

revlist([], []).
revlist([H|T], R) :- revlist(T, Tr), append(Tr, [H], R).
