% exercise 18

butLast([A, B], A).
butLast([_|T], X) :- butLast(T, X).
