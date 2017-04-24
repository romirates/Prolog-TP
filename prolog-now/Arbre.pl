reflet(feuille(X), feuille(X)).
reflet(arbre(X,Y),arbre(A,B)):-
    reflet(Y,A),
    reflet(X,B).
