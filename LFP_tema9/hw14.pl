% exercise 14

check_length([], even).
check_length([_|T], R) :- check_length(T, R2), flip(R2, R).

flip(even, odd).
flip(odd, even).
