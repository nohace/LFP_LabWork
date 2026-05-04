% exercise 10

combineS([], L, L).
combineS(L, [], L).
combineS([A|As], [B|Bs], [A|Rest]) :- A =< B, combineS(As, [B|Bs], Rest).
combineS([A|As], [B|Bs], [B|Rest]) :- B < A, combineS([A|As], Bs, Rest).
