% exercise 3

thief(jim).
likes(mary, apples).
likes(mary, wine).
likes(jim, X) :- likes(X, wine).
maySteal(X, Y) :- thief(X), likes(X, Y).
