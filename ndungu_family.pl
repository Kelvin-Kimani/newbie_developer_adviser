%root spouse from Samuel Ndungu and Nancy Wanjiru.
spouse(ndungu, nancy).

%spouses second in line.
spouse(kimani, florence).
spouse(mbugua, stella).
spouse(mwicigi, wanjiru).
spouse(nganga, sue).


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


%declare all children of Moses Kimani as kimani.
parent(kimani, geoffrey).
parent(kimani, kelvin).
parent(kimani, faith).


%declare all children of John Mwicigi as mwicigi.
parent(mwicigi, imelda).
parent(mwicigi, ian).
parent(mwicigi, dannis).


%declare all children of Selina as selina.
parent(selina, trizah).
parent(selina, 'Nancy Wanjiru I').


%declare all children of Hannah as hannah.
parent(hannah, 'Kelvin Ndungu').
parent(hannah, njenga).


%declare al children of James Mbugua as mbugua.
parent(mbugua, james).
parent(mbugua, nate).


%declare all children of Jane Wangui as wangui.
parent(wangui, monica).


%declare all children of Milka as milka.
parent(milka, charlo).
parent(milka, blessing).
parent(milka, 'the third born, I dont remember her name').


%declare all children of Mukami as mukami.
parent(mukami, jason).
parent(mukami, esperanza).


%declare all chilfren of Geoffrey Nganga as nganga.
parent(nganga, grayson).


%declare all children of Wambui as wambui.
parent(wambui, 'Ndungu').


% males in the family
male(ndungu). 
male(kimani).
male(mwicigi).
male(mbugua).
male(nganga).
male(ngugi).
male(geoffrey).
male(kelvin).
male(ian).
male(dannis).
male('Kelvin Ndungu').
male(njenga).
male(james).
male(nate).
male(charlo).
male(jason).
male(grayson).
male('Ndungu').

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
female(faith).
female(imelda).
female(trizah).
female('Nancy Wanjiru I').
female(monica).
female(blessing).
female('the third born, I dont remember her name').
female(esperanza).

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


predecessor(X, Y) :-
	parent(X, Y).

%predecessor to the second generation
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


% state all the males in the family
% state all the females in the family
% state the spouses, husband and wife
% check if a child is sibling of another 
% determine mother and father of a child
% determine children of a parent

% determine in-law relationships
