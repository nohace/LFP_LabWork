% exercise 26

parent(X, Y) :- father(X, Y).
parent(X, Y) :- mother(X, Y).

descendant(X, Y) :- parent(Y, X).
descendant(X, Y) :- parent(Y, Z), descendant(X, Z).

parents(X, Y, Z) :- father(X, Z), mother(Y, Z).
