
% --- BASE FACTS ---
% mother(Mother, Child)
mother(anna, mary).
mother(anna, ivan).       % Anna's children
mother(olga, peter).
mother(olga, helen).      % Olga's children
mother(irina, anna).
mother(irina, olga).      % Irina is mother of Anna and Olga

% marriages
husband(ivan, helen).
wife(helen, ivan).

% genders
female(irina).
female(anna).
female(olga).
female(mary).
female(helen).
male(ivan).
male(peter).

% --- DERIVED RELATIONSHIPS ---

% father(Father, Child)
father(Father, Child) :-
    mother(Mother, Child),
    husband(Father, Mother).

% child(Child, Parent)
child(C, P) :- mother(P, C).
child(C, P) :- father(P, C).

% sister(Sis, Person)
sister(Sis, Person) :-
    child(Sis, Parent),
    child(Person, Parent),
    Sis \= Person,
    female(Sis).

% --- TASK RELATIONSHIPS ---

% 1. Cousin (female)
cousin_sister(X, Y) :-
    mother(M1, X),
    mother(M2, Y),
    sister(M1, M2),
    X \= Y,
    female(X).

% 2. Mother-in-law
mother_in_law(MIL, Wife) :-
    husband(Husband, Wife),
    mother(MIL, Husband).

% 3. Female ancestor
female_ancestor(X, Y) :-
    mother(X, Y).
female_ancestor(X, Y) :-
    mother(X, Z),
    female_ancestor(Z, Y).

