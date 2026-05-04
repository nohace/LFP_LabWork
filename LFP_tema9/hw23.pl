% exercise 23

isPerm([], []).
isPerm([H|T], B) :- select(H, B, B1), isPerm(T, B1).
