ajouteUn([],[]).
ajouteUn([E1|L1],[E2|L2]):-E2 is E1+1, ajouteUn(L1,L2).
%%max
max(L,X):-
    L = [T|_],
    accMax(L,T,X), !.
accMax([T|Q],Ac,Max):-
    T > Ac,
    accMax(Q,T,Max).
accMax([T|Q],Ac,Max):-
    T =< Ac,
    accMax(Q,Ac,Max).
accMax([],Ac,Ac).

min(L,X):-
    L = [T|_],
    accMin(L,T,X), !.
accMin([T|Q],Ac,Min):-
    T < Ac,
    accMin(Q,T,Min).
accMin([T|Q],Ac,Min):-
    T>= Ac,
    accMin(Q,Ac,Min).
accMin([],Ac,Ac).

multiScal(_,[],[]).
multiScal(M,[E1|L1],[E2|L2]):-E2 is E1*M, multiScal(M,L1,L2).

prodScal([],[],[]).
prodScal([T1|Q1],[T2|Q2],[T3|Q3]):-
    T3 is T1+T2,
    prodScal(Q1,Q2,Q3).
