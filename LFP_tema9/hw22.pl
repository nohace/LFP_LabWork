% exercise 22

subset([], _).
subset([H|T], B) :- member(H, B), subset(T, B).

equal_sets(A, B) :- subset(A, B), subset(B, A).
