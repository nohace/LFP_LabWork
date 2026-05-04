% exercise 9

swap_every_2([], []).
swap_every_2([X], [X]).
swap_every_2([A, B|T], [B, A|R]) :- swap_every_2(T, R).
