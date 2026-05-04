% exercise 19

isSet([]).
isSet([H|T]) :- \+ member(H, T), isSet(T).
