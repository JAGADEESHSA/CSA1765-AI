fact(has_fur, dog).
fact(has_tail, dog).
fact(has_fur, cat).
fact(has_tail, cat).
fact(has_feathers, bird).
rule(mammal, X) :-
    fact(has_fur, X),
    fact(has_tail, X).
rule(animals, X) :-
    % Base case: an empty string has no vowels.
count_vowels([], 0).

% If the head of the list is a vowel, add 1 and check the tail.
count_vowels([H|T], Count) :-
    vowel(H),  % Check if the character is a vowel.
    count_vowels(T, RestCount),
    Count is RestCount + 1.

% If the head of the list is not a vowel, simply check the tail.
count_vowels([_|T], Count) :-
    count_vowels(T, Count).

% Predicate to check if a character is a vowel.
vowel('a').
vowel('e').
vowel('i').
vowel('o').
vowel('u').
vowel('A').
vowel('E').
vowel('I').
vowel('O').
vowel('U').

% Example query:
% ?- count_vowels("hello world", Count).
% Count = 3.
% Base case: an empty string has no vowels.
count_vowels([], 0).

% If the head of the list is a vowel, add 1 and check the tail.
count_vowels([H|T], Count) :-
    vowel(H),  % Check if the character is a vowel.
    count_vowels(T, RestCount),
    Count is RestCount + 1.

% If the head of the list is not a vowel, simply check the tail.
count_vowels([_|T], Count) :-
    count_vowels(T, Count).

% Predicate to check if a character is a vowel.
vowel('a').
vowel('e').
vowel('i').
vowel('o').
vowel('u').
vowel('A').
vowel('E').
vowel('I').
vowel('O').
vowel('U').

% Example query:
% ?- count_vowels("hello world", Count).
% Count = 3.

rule(animals, X) :-
    fact(has_feathers, X).

% Predicate to check if a goal can be entailed from the knowledge base
entails(Goal, _) :- fact(Goal, _).
entails(Goal, Derived) :-
    rule(Consequent, Goal),
    \+ member(Consequent, Derived), % Check if not already derived
    entails(Consequent, [Goal | Derived]).

% Predicate to use backward chaining to prove a goal
prove(Goal) :-
    entails(Goal, []),
    write('Goal '), write(Goal), write(' is proved.'), nl.

prove(Goal) :-
    \+ entails(Goal, []),
    write('Goal '), write(Goal), write(' cannot be proved.'), nl.

% Example queries
?- prove(mammal, dog).
?- prove(animals, dog).
?- prove(mammal, bird).
