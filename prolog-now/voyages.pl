enVoiture(auc,ham).
enVoiture(ham,rag).
enVoiture(valm,sar).
enVoiture(valm,met).

enTrain(met,fra).
enTrain(sar,fra).
enTrain(met,par).
enTrain(sar,par).

enAvion(fra,ban).
enAvion(fra,sing).
enAvion(par,los).
enAvion(ban,auc).
enAvion(sing,ban).
enAvion(los,auc).

voyageDirect(X,Y):-
    (enVoiture(X,Y);
    enTrain(X,Y);
    enAvion(X,Y)).
voyageInD(X,Y):-
    voyageDirect(X,Z),
    voyage(Z,Y).
voyage(X,Y):-
    (voyageDirect(X,Y);
    voyageInD(X,Y)).

