% exercise 24

neg_to_0([], []).
neg_to_0([H|T], [0|R]) :- H < 0, neg_to_0(T, R).
neg_to_0([H|T], [H|R]) :- H >= 0, neg_to_0(T, R).
