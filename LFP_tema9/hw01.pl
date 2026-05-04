% exercise 1

strong(john).
strong(mary).
strong(bill).

owns_cat(mary).
owns_cat(alice).
owns_cat(sam).

owns_dog(john).
owns_dog(bill).

student(arthur).

knows_bill(X) :- strong(X), owns_cat(X).
knows_bill(X) :- student(X).
