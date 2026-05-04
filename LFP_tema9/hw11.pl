% exercise 11

delete_at(X, [X|T], 1, T).
delete_at(X, [H|T], N, [H|R]) :- N > 1, N1 is N - 1, delete_at(X, T, N1, R).
