% exercise 13

flattenList([], []).
flattenList([H|T], F) :- H == [], flattenList(T, F).
flattenList([H|T], F) :- is_list(H), H \== [], flattenList(H, Fh), flattenList(T, Ft), append(Fh, Ft, F).
flattenList([H|T], [H|Ft]) :- \+ is_list(H), flattenList(T, Ft).
