% begin family from Samuel Ndungu and Nancy Wanjiru. 
% Other spouses will be listed here also.
spouse(ndungu, nancy).
spouse(kimani, florence).
spouse(mbugua, stella).


% declare all the children of Samuel Ndungu denoted as ndungu
parent(ndungu, kimani). 
parent(ndungu, mwicigi). 
parent(ndungu, selina). 
parent(ndungu, hannah). 
parent(ndungu, mbugua). 
parent(ndungu, wangui).
parent(ndungu, mugure). 
parent(ndungu, mukami). 
parent(ndungu, milka). 
parent(ndungu, nganga). 
parent(ndungu, wambui). 
parent(ndungu, wanja). 
parent(ndungu, ngugi). 

% males in the family
male(ndungu). 
male(kimani).
male(mwicigi).
male(mbugua).
male(nganga).
male(ngugi).

% female in the family
female(nancy). 
female(selina).
female(hannah).
female(wangui). 
female(mukami). 
female(mugure). 
female(wanja). 
female(milka). 
female(wambui). 
female(florence). 

% rules
ask_spouse :-
	/*
		read from user who they want to check for. 
		after which check the spouse of the person in question. 
	*/
	write('Enter name to check for someone\'s husband or wife.'), nl, 
	read(X), nl,
	check_spouse(X).

check_spouse(X) :-
	spouse(X, Y), write(X), write(' is husband to '), write(Y);
	spouse(Y, X), write(X), write(' is wife to '), write(Y).

father :-
	write('Enter child\'s name to check for their father.'), nl, 
	read(Y), nl,
	parent(X, Y),
	male(X),
	write(X), write(' is father to '), write(Y).

father(X, Y) :-
	parent(X, Y),
	male(X).

wife(Z, X) :-
	spouse(X, Z),
	female(Z).

mother :-
	write('Enter child\'s name to check for their mother.'), nl, 
	read(Y), nl,
	father(X, Y),
	wife(Z, X),
	write(Z), write(' is mother to '), write(Y).

children_of(X):-
	parent(X,Y),
	write(Y).
	
% confirm sibling relationships
is_sibling(X,Y) :-
	parent(Z,X),
	parent(Z,Y).

sibling(X):-
	parent(Z,X),
	children_of(Z).

check_sibling:-
	write('Enter name of person to check for their siblings'),nl, 
	read(X),nl,
	sibling(X).

	%parent(Z,X),
	%repeat, children_of(Z),nl.
	%write('Siblings of '), write(X), write(' are '), forall(sibling,children_of(Z), nl).

brother(X,Y):-
	is_sibling(X,Y),
	male(X).

brothers(X):-
	Y == sibling(X),
	male(Y).


sister(X,Y):-
	is_sibling(X,Y),
	female(X).




/*predecessor(X, Y) :-
	parent(X, Y).

predecessor(X, Y) :-
	parent(X, Z),
	predecessor(Z, Y).
	
grandparent(X,Z):-
	parent(X,Y),
	parent(Y,Z).

grandfather(X,Z):-
	parent(X,Y),
	male(X).

grandmother(X,Z):-
	parent(X,Y),
	female(X).
*/


% state all the males in the family
% state all the females in the family
% state the spouses, husband and wife
% check if a child is sibling of another 
% determine mother and father of a child
% determine children of a parent

% determine in-law relationships