% Pattern matching rule to check if a list contains a specific element.
contains([Element|_], Element).   % Base case: If the element is the head, it matches.
contains([_|Tail], Element) :-     % Recursive case: Check the tail of the list.
    contains(Tail, Element).

% Example query:
% ?- contains([1, 2, 3, 4], 3).
% true.
