%Partie 1 - implementation des operations
valeur_binaire(o).
valeur_binaire(u).

addition(o, o, o).
addition(u, o, u).
addition(o, u, u).
addition(u, u, o).
multiplication(o, o, o).
multiplication(u, o, o).
multiplication(o, u, o).
multiplication(u, u, u).


%Partie 1 - implementation de la multiplication
addition_vecteur_ligne([], [], []).
addition_vecteur_ligne([X|L1], [Y|L2], [Z|L3]) :-
	addition(X, Y, Z),
	addition_vecteur_ligne(L1, L2, L3).

vecteur_nul(0, []).
vecteur_nul(N, [o|L]) :-
	N > 0,
	N1 is N - 1,
	vecteur_nul(N1, L).
	
mult_vect_mat([u], [L], L). 
mult_vect_mat([o], [L], Lo) :-
	length(L, X),
	vecteur_nul(X, Lo), !. 
	
mult_vect_mat([o|V], [_|M], R) :- mult_vect_mat(V, M, R). 

mult_vect_mat([u|V], [L|M], R2) :-
	mult_vect_mat(V, M, R1), 
	addition_vecteur_ligne(L, R1, R2).
	
	

%Partie 1 : implementation des fonctions solutions
vecteur_binaire([], 0).
vecteur_binaire([X|V], N) :- 
    N>0, 
    N1 is N-1, 
    vecteur_binaire(V, N1), 
    valeur_binaire(X).
    
    
solution(M, V) :- 
	length(M, Nl), 
	M = [Pl|_],
	length(Pl, Nc), 
	vecteur_nul(Nc, Zero),     
	vecteur_binaire(V, Nl),
	mult_vect_mat(V, M, Zero).


compte_vrai([], 0).
compte_vrai([u|L], N) :-
	compte_vrai(L, N1),
	N is N1 + 1.
compte_vrai([o|L], N) :-
	compte_vrai(L, N).

solution_binaire(M, V, Nombre) :- 
	length(M, Nl),
	M = [Pl|_],
	length(Pl, Nc),
	vecteur_nul(Nc, Zero),
	vecteur_binaire(V,Nl),
	compte_vrai(V, Nombre),
	mult_vect_mat(V, M, Zero).

solution_binaire(M, V, Y, Nombre) :-
	length(M, Nl),
	vecteur_binaire(V, Nl),
	compte_vrai(V, Nombre),
	mult_vect_mat(V, M, Y).

%Partie 1 : test avec les matrices fournies
m_facile([
	[o,u,o,o,o,u,u,o,o,o,o,o,u],
	[o,u,u,u,u,u,u,u,u,o,u,u,o],
	[u,o,o,u,o,o,u,o,o,u,u,o,u],
	[u,u,o,u,u,o,o,u,u,o,o,u,u],
	[u,u,u,o,o,u,o,o,o,o,u,o,o],
	[u,o,o,u,u,u,u,o,o,o,o,u,o],
	[u,o,o,o,o,o,u,o,u,o,o,o,o],
	[o,u,u,o,o,o,u,u,u,u,o,o,o],
	[u,u,u,u,u,u,o,o,o,o,u,u,o],
	[o,o,u,o,o,u,o,u,u,u,u,u,u],
	[u,o,u,u,o,u,o,u,o,o,o,o,o],
	[o,u,u,o,u,u,o,o,o,u,u,u,u],
	[o,o,u,o,u,o,o,u,u,o,o,o,u],
	[o,u,o,u,u,u,u,o,o,u,o,o,o],
	[o,u,u,u,o,o,o,o,u,o,u,o,o],
	[o,u,u,u,o,o,u,o,o,o,u,u,o],
	[u,u,o,o,o,u,u,u,o,o,o,u,o],
	[u,o,o,u,u,o,o,o,u,o,o,o,o],
	[u,o,u,u,o,u,o,o,u,u,u,u,u],
	[u,o,o,u,o,o,o,u,u,o,u,u,u],
	[u,u,o,o,o,u,o,o,o,u,u,u,u],
	[o,o,u,u,o,o,o,u,u,o,u,u,o],
	[o,u,o,o,u,u,o,u,u,o,o,u,o],
	[u,u,u,u,o,u,o,u,o,u,o,u,o],
	[o,o,o,u,u,u,u,o,u,o,o,o,u],
	[o,o,o,o,o,u,u,o,o,o,o,o,u]
]).
y_facile([o,u,u,u,o,o,u,u,o,u,o,o,u]).
m_moyen([
	[u,o,u,o,u,u,o,u,u,u,o,o,o],
	[u,o,u,o,o,u,u,o,o,o,u,u,o],
	[u,u,u,u,o,u,o,o,o,o,u,u,u],
	[o,o,o,o,o,u,u,o,u,o,u,u,o],
	[o,u,o,o,o,u,o,u,o,u,u,o,u],
	[u,u,u,o,u,u,o,u,o,u,o,o,u],
	[o,u,u,u,u,o,o,u,o,u,u,o,u],
	[u,u,o,o,u,u,o,u,o,u,u,o,u],
	[o,o,u,u,u,u,u,u,u,o,u,u,o],
	[u,u,u,u,o,o,u,u,o,u,u,u,o],
	[u,o,o,u,u,o,o,o,o,u,u,u,u],
	[u,u,u,u,u,u,u,o,u,o,u,o,u],
	[u,o,o,u,o,o,o,u,u,o,o,u,o],
	[o,u,o,u,u,o,u,o,o,u,u,o,u],
	[o,u,o,o,o,o,o,u,u,u,u,o,u],
	[u,u,o,u,o,u,u,u,u,o,o,u,u],
	[u,u,u,o,o,u,u,o,o,u,o,u,u],
	[o,u,o,u,u,o,o,o,u,o,u,u,u],
	[o,u,u,o,o,u,o,u,o,u,u,u,u],
	[u,o,o,u,o,o,o,u,o,u,o,u,u],
	[o,o,o,u,u,u,o,u,u,u,o,o,u],
	[o,o,o,u,o,o,u,u,u,u,u,u,o],
	[u,u,u,u,u,o,o,u,u,u,o,o,u],
	[o,u,o,u,o,o,o,u,u,u,u,o,u],
	[o,u,o,u,o,o,o,u,o,u,o,u,u],
	[o,o,u,o,u,o,o,o,u,o,o,o,o]
]).
y_moyen([u,u,o,o,o,o,o,o,u,o,u,o,u]).
m_dur([
	[u,u,u,o,u,o,u,u,o,u,o,u,o,o,o],
	[u,o,o,o,u,u,o,u,u,u,o,u,u,u,o],
	[o,u,u,u,o,o,u,o,o,o,u,u,u,u,o],
	[o,o,o,u,u,o,o,u,u,o,o,o,o,o,o],
	[u,o,o,o,u,o,o,o,o,o,o,u,o,o,o],
	[u,u,o,u,u,o,o,u,u,o,o,o,o,u,o],
	[u,o,o,o,u,o,u,o,u,u,o,o,u,o,o],
	[u,u,o,u,o,u,u,u,o,u,u,u,u,u,o],
	[u,o,o,o,u,u,u,u,u,u,o,o,o,u,u],
	[o,u,u,o,u,o,u,u,u,u,u,o,u,o,o],
	[u,o,u,o,u,u,o,o,u,o,u,u,u,u,o],
	[o,u,o,u,o,u,o,o,u,u,u,o,u,u,o],
	[o,u,u,o,o,o,o,o,u,u,o,u,o,o,o],
	[u,u,o,o,u,u,o,o,u,u,u,o,u,u,o],
	[o,o,u,o,o,o,u,o,o,o,u,u,u,u,u],
	[u,u,o,o,o,o,u,o,u,o,u,u,o,u,u],
	[o,u,u,o,u,o,u,o,o,u,u,o,u,u,u],
	[o,u,u,u,o,o,o,o,u,o,o,u,u,o,o],
	[u,o,u,o,u,o,u,o,u,o,u,u,u,o,o],
	[o,u,u,o,u,u,u,u,u,o,o,u,o,u,u],
	[u,u,u,u,u,o,u,o,o,u,u,u,u,o,u],
	[o,o,u,u,u,o,o,u,u,o,u,u,o,o,o],
	[u,u,u,u,u,u,u,o,o,u,u,o,u,u,o],
	[u,o,u,o,u,u,u,u,u,o,u,o,o,u,u],
	[u,o,o,o,u,u,u,u,u,u,u,u,u,u,u],
	[o,o,o,u,o,o,o,o,o,u,o,o,o,o,o],
	[u,u,o,u,o,o,u,u,o,o,u,o,o,u,u],
	[u,o,u,o,o,u,o,o,o,o,o,o,u,u,u],
	[u,o,o,u,o,u,u,o,u,u,o,o,u,u,u],
	[o,u,o,o,o,o,o,u,u,o,o,o,u,u,u]
]).
y_dur([o,u,u,o,u,u,u,u,u,o,o,o,o,o,u]).


%Partie 2 - implementation des operations
valeur_ternaire(o).
valeur_ternaire(u).
valeur_ternaire(d).

addition3(o, o, o).
addition3(u, o, u).
addition3(o, u, u).
addition3(d, o, d).
addition3(o, d, d).
addition3(u, u, d).
addition3(d, u, o).
addition3(u, d, o).
addition3(d, d, u).


multiplication3(o, o, o).
multiplication3(o, u, o).
multiplication3(u, o, o).
multiplication3(o, d, o).
multiplication3(d, o, o).
multiplication3(u, u, u).
multiplication3(u, d, d).
multiplication3(d, u, d).
multiplication3(d, d, u).
 
addition_vecteur_ligne3([], [], []).
addition_vecteur_ligne3([X|L1], [Y|L2], [Z|L3]) :-
	addition3(X, Y, Z),
	addition_vecteur_ligne3(L1, L2, L3).


%Implementation de la multiplication
mult_scalaire3(_, [], []).
mult_scalaire3(S, [X|L], [Z|R]) :-
	multiplication3(S, X, Z),
	mult_scalaire3(S, L, R).
	
mult_vect_mat3([X], [L], R) :-
	mult_scalaire3(X, L, R).
mult_vect_mat3([o|V], [_|M], R) :-
	mult_vect_mat3(V, M, R).
mult_vect_mat3([X|V], [L|M], R2) :-
	X \= o,
	mult_vect_mat3(V, M, R1),
	mult_scalaire3(X, L, LX),
	addition_vecteur_ligne3(LX, R1, R2).


%Implementation de la solution
vecteur_ternaire([], 0).
vecteur_ternaire([X|L], N) :-
	N > 0, 
	N1 is N - 1,
	vecteur_ternaire(L, N1), 
	valeur_ternaire(X).

compte_non_nul3([], 0).
compte_non_nul3([o|L], N) :-
	compte_non_nul3(L, N).
compte_non_nul3([X|L], N) :-
	compte_non_nul3(L, N1),
	valeur_ternaire(X), 
	X \= o, 
	N is N1 + 1.

solution_ternaire(M, V) :-
	length(M, Nl), 
	M = [Pl|_], 
	length(Pl, Nc), 
	vecteur_nul(Nc, Zero), 
	vecteur_ternaire(V, Nl), 
	mult_vect_mat3(V, M, Zero).

solution_ternaire(M, V, Nombre) :-
	length(M, Nl), 
	M = [Pl|_], 
	length(Pl, Nc), 
	vecteur_nul(Nc, Zero), 
	vecteur_ternaire(V, Nl),
	compte_non_nul3(V, Nombre),  
	mult_vect_mat3(V, M, Zero).

solution_ternaire(M, V, Y, Nombre) :-
	length(M, Nl),
	vecteur_ternaire(V, Nl),
	compte_non_nul3(V, Nombre),
	mult_vect_mat3(V, M, Y).

m3_facile([
	[u,o,u,o,d,o,o,d,o,u],
	[o,o,o,o,d,o,o,o,d,d],
	[d,d,d,d,o,u,o,o,o,o],
	[u,o,d,o,u,u,u,o,d,d],
	[o,d,d,u,d,d,u,o,o,o],
	[u,u,u,o,d,d,d,o,d,u],
	[d,u,o,o,u,o,o,d,o,d],
	[d,d,u,d,o,o,o,d,u,o],
	[o,u,o,d,d,d,o,o,d,d],
	[u,o,d,u,d,u,o,d,o,u],
	[d,o,d,d,d,d,d,d,d,o],
	[d,u,d,o,d,d,o,o,d,d],
	[o,o,d,d,u,d,d,o,o,d],
	[d,d,o,u,u,d,d,o,o,u],
	[d,d,u,d,u,u,o,u,o,u],
	[d,u,u,u,u,u,o,o,o,d],
	[d,o,u,u,d,u,o,d,u,u],
	[d,o,o,u,u,o,d,d,o,o],
	[d,d,u,o,u,u,o,o,o,d],
	[d,o,d,d,o,u,o,o,d,o]
]).
y3_facile([d,d,d,d,o,u,d,d,u,o]).
 
m3_moyen([
	[d,o,d,d,u,u,o,d,o,u],
	[d,o,d,u,u,u,o,u,u,o],
	[d,o,o,o,o,o,o,d,o,u],
	[o,o,d,u,o,d,o,u,u,d],
	[o,o,u,o,d,u,u,d,u,u],
	[d,o,u,d,o,o,o,u,d,d],
	[d,o,u,o,u,d,u,d,o,u],
	[d,o,u,d,d,d,o,d,d,d],
	[o,o,o,u,d,u,u,d,d,o],
	[o,u,o,d,o,o,d,o,u,o],
	[o,u,o,u,o,o,u,o,o,d],
	[u,o,o,o,d,o,o,u,d,d],
	[d,u,u,u,d,o,u,u,u,d],
	[d,o,u,u,o,o,u,u,u,o],
	[u,u,d,d,o,d,u,o,u,o],
	[u,o,o,u,o,d,o,d,o,o],
	[o,d,d,o,o,o,u,d,u,o],
	[o,u,u,d,d,o,u,u,o,o],
	[d,u,u,o,u,d,u,u,u,u],
	[u,o,d,u,d,u,d,o,u,d]
]).
y3_moyen([u,d,o,o,d,d,d,d,o,u]).
 
m3_dur([
	[o,d,d,o,d,o,d,o,d,d],
	[d,o,o,o,u,d,o,o,d,u],
	[u,o,d,d,o,u,d,d,u,u],
	[d,o,u,u,o,o,d,o,d,o],
	[d,u,u,u,o,o,o,d,o,u],
	[d,o,u,d,u,u,d,d,d,u],
	[o,d,d,u,u,u,d,u,u,u],
	[d,d,u,d,o,o,d,o,d,u],
	[o,u,o,d,u,u,d,o,u,u],
	[o,o,d,u,d,u,u,d,d,o],
	[u,u,o,o,d,o,d,u,o,u],
	[o,d,u,o,u,d,o,d,o,d],
	[u,o,d,d,u,u,d,o,d,u],
	[u,o,u,u,d,u,u,o,u,o],
	[d,u,o,o,d,o,d,o,o,u],
	[o,o,o,d,d,u,o,o,u,d],
	[o,o,o,d,d,o,o,o,u,u],
	[u,o,o,d,u,d,d,d,u,o],
	[d,u,u,u,o,d,o,o,d,u],
	[o,u,d,d,o,d,d,o,o,o]
]).
y3_dur([u,o,d,d,d,u,o,u,d,u]).
