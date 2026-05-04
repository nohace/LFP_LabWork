% exercise 30

merge([], L, L).
merge(L, [], L).
merge([A|As], [B|Bs], [A|R]) :- A =< B, merge(As, [B|Bs], R).
merge([A|As], [B|Bs], [B|R]) :- B < A, merge([A|As], Bs, R).

split([], _, [], []).
split([H|T], P, A, B) :- H =< P, split(T, P, A1, B1), A = [H|A1], B = B1.
split([H|T], P, A, B) :- H > P, split(T, P, A1, B1), A = A1, B = [H|B1].

mysort([], []).
mysort([H|T], S) :- split(T, H, A, B), mysort(A, Sa), mysort(B, Sb), merge(Sa, [H|Sb], S).
