% exercise 8

minim([X], X).
minim([H|T], M) :- minim(T, Mt), (H < Mt -> M = H ; M = Mt).
