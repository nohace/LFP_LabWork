% exercise 21

subtract([], _, []).
subtract([H|T], B, R) :- member(H, B), subtract(T, B, R).
subtract([H|T], B, [H|R]) :- \+ member(H, B), subtract(T, B, R).
