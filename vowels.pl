% Define vowels
vowel(a).
vowel(e).
vowel(i).
vowel(o).
vowel(u).

% Base case: empty list has 0 vowels
count_vowels([], 0).

% Recursive case: if head is a vowel, increment the count
count_vowels([H|T], Count) :-
    vowel(H),
    count_vowels(T, RestCount),
    Count is RestCount + 1.

% Recursive case: if head is not a vowel, do not increment the count
count_vowels([H|T], Count) :-
    \+ vowel(H),
    count_vowels(T, Count).

% Helper predicate to convert a string to a list of characters and count vowels
vowel_count(String, Count) :-
    string_chars(String, CharList),
    count_vowels(CharList, Count).
