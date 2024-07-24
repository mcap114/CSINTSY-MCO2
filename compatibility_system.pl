% compatibility_system.pl

% FACTS


% Facts: Sign classification based on Classical Elements
fire_sign('Aries').
fire_sign('Leo').
fire_sign('Sagittarius').

earth_sign('Taurus').
earth_sign('Virgo').
earth_sign('Capricorn').

air_sign('Gemini').
air_sign('Libra').
air_sign('Aquarius').

water_sign('Cancer').
water_sign('Scorpio').
water_sign('Pisces').

% Facts: Sign classification based on Modality
cardinal_sign('Aries').
cardinal_sign('Cancer').
cardinal_sign('Libra').
cardinal_sign('Capricorn').

fixed_sign('Taurus').
fixed_sign('Leo').
fixed_sign('Scorpio').
fixed_sign('Aquarius').

mutable_sign('Gemini').
mutable_sign('Virgo').
mutable_sign('Sagittarius').
mutable_sign('Pisces').



% COMPATIBILITY RULES



% Rule: General compatibility for fire signs
compatible(Sign1, Sign2) :- 
    fire_sign(Sign1),
    fire_sign(Sign2),
    format('~w and ~w are compatible: They are both fire signs, which typically share energy, enthusiasm, and a dynamic approach to life.~n', [Sign1, Sign2]).

% Rule: Fire signs are compatible with air signs
compatible(Sign1, Sign2) :-
    fire_sign(Sign1),
    air_sign(Sign2),
    format('~w and ~w are compatible: They share an optimism and curiosity about life, which ensures their time together is filled with exploration, laughter, and mutual growth.~n', [Sign1, Sign2]).

% Rule: General compatibility for earth signs
compatible(Sign1, Sign2) :- 
    earth_sign(Sign1),
    earth_sign(Sign2),
    format('~w and ~w are compatible: They are both earth signs, which typically share practical and stable qualities.~n', [Sign1, Sign2]).

% Rule: Earth signs are compatible with water signs
compatible(Sign1, Sign2) :-
    earth_sign(Sign1),
    water_sign(Sign2),
    format('~w and ~w are compatible: Earth and water signs complement each other well, with earth providing stability and water offering emotional depth.~n', [Sign1, Sign2]).

% Rule: Water signs are compatible with earth signs
compatible(Sign1, Sign2) :-
    water_sign(Sign1),
    earth_sign(Sign2),
    format('~w and ~w are compatible: Earth and water signs complement each other well, with earth providing stability and water offering emotional depth.~n', [Sign1, Sign2]).


% Rule: General compatibility for air signs
compatible(Sign1, Sign2) :- 
    air_sign(Sign1),
    air_sign(Sign2),
    format('~w and ~w are compatible: They are both air signs, which typically share intellectual and communicative qualities.~n', [Sign1, Sign2]).

% Rule: Air signs are compatible with fire signs
compatible(Sign1, Sign2) :-
    air_sign(Sign1),
    fire_sign(Sign2),
    format('~w and ~w are compatible: They share an optimism and curiosity about life, which ensures their time together is filled with exploration, laughter, and mutual growth.~n', [Sign1, Sign2]).

% Rule: General compatibility for water signs
compatible(Sign1, Sign2) :- 
    water_sign(Sign1),
    water_sign(Sign2),
    format('~w and ~w are compatible: They are both water signs, meaning they find an intuitive understanding and emotional resonance that can be deeply fulfilling.~n', [Sign1, Sign2]).



% INCOMPATIBILITY RULES



% Rule: Fire signs are generally incompatible with water signs
incompatible(Sign1, Sign2) :-
    fire_sign(Sign1),
    water_sign(Sign2),
    format('~w and ~w are generally incompatible: Fire and water signs often clash, with fire being too intense and water being too emotional.~n', [Sign1, Sign2]).

% Rule: Fire signs are generally incompatible with earth signs
incompatible(Sign1, Sign2) :-
    fire_sign(Sign1),
    earth_sign(Sign2),
    format('~w and ~w are generally incompatible: Fire signs may find earth signs too slow or cautious, while earth signs may see fire signs as reckless or impulsive.~n', [Sign1, Sign2]).

% Rule: Air signs are generally incompatible with water signs
incompatible(Sign1, Sign2) :-
    air_sign(Sign1),
    water_sign(Sign2),
    format('~w and ~w are generally incompatible: Air signs may find water signs too emotional or clingy, while water signs may see air signs as detached or inconsistent.~n', [Sign1, Sign2]).

% Rule: Earth signs are generally incompatible with air signs
incompatible(Sign1, Sign2) :-
    earth_sign(Sign1),
    air_sign(Sign2),
    format('~w and ~w are generally incompatible: Earth and air signs often have different priorities, with earth being practical and air being intellectual.~n', [Sign1, Sign2]).



% Rule: Check if two zodiac signs are compatible
relationship_compatibility(Sign1, Sign2) :-
    compatible(Sign1, Sign2);
    compatible(Sign2, Sign1).

% Rule: Check if two zodiac signs are incompatible
relationship_incompatibility(Sign1, Sign2) :-
    incompatible(Sign1, Sign2);
    incompatible(Sign2, Sign1).


% Query examples:
$ ?- compatible('Scorpio', 'Sagittarius').
% ?- relationship_compatibility('Aries', 'Leo').
% ?- relationship_incompatibility('Aries', 'Cancer').

