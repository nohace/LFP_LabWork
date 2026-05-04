% exercise 5

course(alex, algebra, tuesday).
course(alex, webdesign, wednesday).
course(mary, algebra, monday).
course(mary, analysis, tuesday).
course(mary, webdesign, wednesday).

samecourse(S1, S2, C) :- course(S1, C, _), course(S2, C, _), S1 \= S2.

busyday(S, D) :- course(S, _, D).
