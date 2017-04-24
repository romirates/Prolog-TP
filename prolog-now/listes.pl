%%encore des listes
%%member
member(X,[X|_]).
member(X,[_|Q]):-member(X,Q).
%%concatené 2 listes 
concat([],L,L).
concat([T|Q],L2,[T|L3]):-concat(Q,L2,L3).
%%preffixe d'une liste
preffixe(P,L):-concat(P,_,L).
%%suffixe d'une liste
suffixe(S,L):-concat(_,S,L).
%%les sous listes d'une liste (ordonnée
%%se sont les preffixe des suffixe de la liste originale
subList(Sb,L):-suffixe(S,L),preffixe(Sb,S).

%%inversion naïve en utilisant la concatenation de 2 liste
%%cas de base la liste est vide sont inverse est la liste vide
%%cas résursif L=[T|Q] invL = [inv(Q)|T]
invNaive([],[]).
invNaive([T|Q],R):- invNaive(Q,Inv),concat(Inv,[T],R).

%%inversion avec Accumulateur (recursivité terminale)
invAcc([T|Q],Acc,R):-invAcc(Q,[T|Acc],R).
invAcc([],Acc,Acc).

inverse(L,R):-invAcc(L,[],R).
%%exercice 6.1 liste double 
double(Liste):-concat(X,X,Liste),!.

%%exercice 6.2 palindrome
%%unification de la liste et de son inverse
palindrome(Liste):- inverse(Liste,Liste).

%%exercice 6.3 rogne
rogne([_,_],[]).
rogne(L,Q):-concat([_|Q],[_],L).
%%exercice 6.4 dernier 
%%avec inverse
dernier([X],X).
dernier(L,X):- inverse(L,[X|_]).

%%par recursivité
dernierR([X],X).
dernierR([_|Q],X):-dernier(Q,X).

%%Exercice 6.5 miroir
%%par récurssivité
miroirRe([Prem,Dern],[Dern,Prem]).
miroirRe([Prem,Suiv|Q1],[Dern,Suiv|Q2]):-miroirRe([Prem|Q1],[Dern|Q2]).
%%avec append
miroirAp([T1|Q1],[T2|Q2]):- append(Millieu,[T1],Q2), append(Millieu,[T2],Q1).
%%crée un set depuis une liste quelconque avec member
set(L,X):- ajout(L,[],X),!.
ajout([],X,X).
ajout([T|Q],S,X):-member(T,S),ajout(Q,S,X).
ajout([T|Q],S,X):-append(S,[T],R),ajout(Q,R,X).

aplat(L1,L2):-
	aplatir(L1,L2).
%%aplatir([T|[]],T).
aplatir([],[]).
aplatir([[T]|[]],L):-aplatir(T,L).
aplatir([T|Q],[L2,X]):-
	aplatir(T,L2),
	aplatir(Q,X).
%%[[2,3,[[1,2]],[]] =>[2,3,1,2]
%%[2,3] -- [[1,2],[]]


	
decoup([X|Q],[X|L]):-
	X \=[_|_],
	X \= [],
	decoup(Q,L).
decoup([T|Q],X):-
	estVide(Q),
	decoup(T,X).
	
decoup([[T]|Q],X):-
	decoup([T|Q],X).
	

decoup([],[]).

estVide([]).
estVide([Q]):-estVide(Q).

elemPaire([],[]).
elemPaire([_,E|Q],[E|P]):-elemPaire(Q,P).
