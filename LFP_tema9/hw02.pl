% exercise 2

neighbor(stephen, peter).
neighbor(peter, stephen).

married(stephen, ds).
married(ds, stephen).
married(peter, pa).
married(pa, peter).

doctor(ds).
works_at(ds, emergency).

actress(pa).
works_at(pa, national_theatre).

melomaniac(stephen).
hunter(peter).

sentimental(X) :- melomaniac(X).
liar(X) :- hunter(X).

likes(W, P) :- actress(W), sentimental(P).

neighbor(X, Z) :- married(X, W), neighbor(W, Z).
