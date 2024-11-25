% Database of planets with names, types, and distances from the sun
planet(mercury, rocky, 0.39).
planet(venus, rocky, 0.72).
planet(earth, rocky, 1.00).
planet(mars, rocky, 1.52).
planet(jupiter, gas_giant, 5.20).
planet(saturn, gas_giant, 9.58).
planet(uranus, gas_giant, 19.22).
planet(neptune, gas_giant, 30.05).

% Predicate to query planets of a specific type
planets_of_type(Type, Planets) :-
    findall(Name, planet(Name, Type, _), Planets).

% Predicate to query planets within a specific distance range
planets_within_distance(Min, Max, Planets) :-
    findall(Name, (planet(Name, _, Distance), Distance >= Min, Distance <= Max), Planets).

% Example queries
?- planets_of_type(rocky, RockyPlanets).
RockyPlanets = [mercury, venus, earth, mars].

?- planets_within_distance(5, 20, NearbyPlanets).
NearbyPlanets = [jupiter, saturn, uranus].

?- planet(Name, Type, Distance), Distance > 10.
Name = uranus,
Type = gas_giant,
Distance = 19.22 ;
Name = neptune,
Type = gas_giant,
Distance = 30.05.

