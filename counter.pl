# symbol sequences represented as lists

count_bulls([], [], 0, [], []).

count_bulls([H1|T1], [H2|T2], Bulls, RL, RR):-
    H1 = H2,
    count_bulls(T1, T2, Bulls1, RL, RR),
    Bulls is Bulls1 + 1, !.

count_bulls([H1|T1], [H2|T2], Bulls, RL, RR):-
    H1 \= H2,
    count_bulls(T1, T2, Bulls1, RL1, RR1),
    append([H1], RL1, RL),
    append([H2], RR1, RR),
    
    Bulls is Bulls1, !.

count_cows([], _, 0).

count_cows([H1|T1], [H2|T2], C):-
    H1 \= H2,
    member(H1, T2),
    append(T2, [H2], L),
    count_cows(T1, L, C1),
    C is C1 + 1, !.

count_cows([H1|T1], [H2|T2], C):-
    H1 \= H2,
    append(T2, [H2], L),
    count_cows(T1, L, C1),
    C is C1, !.

count_cows([H1|T1], [H2|T2], C):-
    H1 = H2,
    append(T2, [H2], L),
    count_cows(T1, L, C1),
    C is C1, !.

count_bulls_and_cows(L, R, B, C):-
    count_bulls(L, R, B, LR, RR),
    count_cows(LR, RR, C), !.

write_bulls_and_cows(B, C):-
    number_string(B, Bulls),
    number_string(C, Cows),
    string_concat("Bulls = ", Bulls, BullsString),
    string_concat("Cows = ", Cows, CowsString),
    writeln(BullsString),
    writeln(CowsString),
     !.
    