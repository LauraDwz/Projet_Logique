addition(o, o, o).
addition(u, o, u).
addition(o, u, u).
addition(u, u, o).
multiplication(o, o, o).
multiplication(u, o, o).
multiplication(o, u, o).
multiplication(u, u, u).

addition_vecteur_ligne([X], [Y], [Z]) :- addition(X, Y, Z).
addition_vecteur_ligne([X|L1], [Y|L2], [Z|L3]) :-
    addition(X, Y, Z),
    addition_vecteur_ligne(L1, L2, L3).

liste_o(0, []).
liste_o(N, [o|L]) :-
    N > 0,
    N1 is N - 1,
    liste_o(N1, L).

mult_vect_mat([u], [L], L). 
mult_vect_mat([o], [L], Lo) :-
	length(L, X), 
	liste_o(X, Lo), !. 
	
mult_vect_mat([o|V], [_|M], R) :- mult_vect_mat(V, M, R). 

mult_vect_mat([u|V], [L|M], R2) :-
	mult_vect_mat(V, M, R1), 
	addition_vecteur_ligne(L, R1, R2).
