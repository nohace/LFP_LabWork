% exercise 29

merge([], L, L).
merge(L, [], L).
merge([A|As], [B|Bs], [A|R]) :- A =< B, merge(As, [B|Bs], R).
merge([A|As], [B|Bs], [B|R]) :- B < A, merge([A|As], Bs, R).
