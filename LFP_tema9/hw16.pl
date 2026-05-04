% exercise 16

remove_duplicates([], []).
remove_duplicates([X, X|T], R) :- remove_duplicates([X|T], R).
remove_duplicates([X|T], [X|R]) :- remove_duplicates(T, R).
