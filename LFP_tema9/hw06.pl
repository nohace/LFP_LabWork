% exercise 6

separate([], [], []).
separate([H|T], R1, R2) :- H < 10, separate(T, R1a, R2a), R1 = [H|R1a], R2 = R2a.
separate([H|T], R1, R2) :- H >= 10, separate(T, R1a, R2a), R1 = R1a, R2 = [H|R2a].
