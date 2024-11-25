% Define the initial state and goal state
initial_state(state(monkey(at_room), box(at_floor), bananas(out_of_reach))).
goal_state(state(monkey(at_banana), box(at_floor), bananas(grabbed))).

% Movement rules
move_monkey(state(monkey(at_room), box(at_floor), bananas(out_of_reach)), state(monkey(at_box), box(at_floor), bananas(out_of_reach))).
move_monkey(state(monkey(at_box), box(at_floor), bananas(out_of_reach)), state(monkey(at_banana), box(at_floor), bananas(out_of_reach))).

% Pushing the box to a new location (box can be moved)
push_box(state(monkey(at_box), box(at_floor), bananas(out_of_reach)), state(monkey(at_box), box(at_box), bananas(out_of_reach))).

% Climbing the box (if monkey is at the box)
climb_box(state(monkey(at_box), box(at_box), bananas(out_of_reach)), state(monkey(at_banana), box(at_box), bananas(out_of_reach))).

% Grabbing bananas (if monkey is at the banana)
grab_banana(state(monkey(at_banana), box(at_box), bananas(out_of_reach)), state(monkey(at_banana), box(at_box), bananas(grabbed))).

% Define the goal: When the monkey is at the bananas and has grabbed them
is_goal_state(state(monkey(at_banana), box(at_box), bananas(grabbed))).

% Define the actions
actions(State, NewState) :-
    move_monkey(State, NewState).
actions(State, NewState) :-
    push_box(State, NewState).
actions(State, NewState) :-
    climb_box(State, NewState).
actions(State, NewState) :-
    grab_banana(State, NewState).

% Define the solution to the problem (depth-first search for simplicity)
solve(State, []) :- is_goal_state(State).
solve(State, [Action | RestOfPlan]) :-
    actions(State, NewState),
    solve(NewState, RestOfPlan),
    Action = NewState.

% Query to solve the problem
run :-
    initial_state(InitialState),
    solve(InitialState, Plan),
    print_plan(Plan).

print_plan([]).
print_plan([Action | Rest]) :-
    write(Action), nl,
    print_plan(Rest).


