% exercise 17

lastElem([X], X).
lastElem([_|T], X) :- lastElem(T, X).
