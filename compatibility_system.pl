% compatibility_system.pl

:- [utils].

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
    fire_sign(Sign2).

% Rule: General compatibility for earth signs
compatible(Sign1, Sign2) :- 
    earth_sign(Sign1),
    earth_sign(Sign2).

% Rule: General compatibility for air signs
compatible(Sign1, Sign2) :- 
    air_sign(Sign1),
    air_sign(Sign2).

% Rule: General compatibility for water signs
compatible(Sign1, Sign2) :- 
    water_sign(Sign1),
    water_sign(Sign2).

% Rule: Water signs are compatible with earth signs
compatible(Sign1, Sign2) :-
    ((water_sign(Sign1), earth_sign(Sign2));
     (earth_sign(Sign1), water_sign(Sign2))).

% Rule: Fire signs are compatible with air signs
compatible(Sign1, Sign2) :-
    ((fire_sign(Sign1), air_sign(Sign2));
     (air_sign(Sign1), fire_sign(Sign2))).

% INCOMPATIBILITY RULES

% Rule: Fire signs are generally incompatible with water signs
incompatible(Sign1, Sign2) :-
    fire_sign(Sign1),
    water_sign(Sign2).

% Rule: Earth signs are generally incompatible with fire signs
incompatible(Sign1, Sign2) :-
    fire_sign(Sign1),
    earth_sign(Sign2).

% Rule: Water signs are generally incompatible with air signs
incompatible(Sign1, Sign2) :-
    air_sign(Sign1),
    water_sign(Sign2).

% Rule: Air signs are generally incompatible with earth signs
incompatible(Sign1, Sign2) :-
    earth_sign(Sign1),
    air_sign(Sign2).

% Rule: Check if two zodiac signs are compatible
relationship_compatibility(Sign1, Sign2) :-
    compatible(Sign1, Sign2);
    compatible(Sign2, Sign1).

% Rule: Check if two zodiac signs are incompatible
relationship_incompatibility(Sign1, Sign2) :-
    incompatible(Sign1, Sign2);
    incompatible(Sign2, Sign1).

% Provide a description based on compatibility
compatibility_description(Sign1, Sign2) :-
    (   fire_sign(Sign1),
        fire_sign(Sign2)
    ->  format('They are both fire signs, which typically share energy, enthusiasm, and a dynamic approach to life.~n')
    ;   earth_sign(Sign1),
        earth_sign(Sign2)
    ->  format('They are both earth signs, which typically share practical and stable qualities.~n')
    ;   air_sign(Sign1),
        air_sign(Sign2)
    ->  format('They are both air signs, which typically share intellectual and communicative qualities.~n')
    ;   water_sign(Sign1),
        water_sign(Sign2)
    ->  format('They are both water signs, meaning they find an intuitive understanding and emotional resonance that can be deeply fulfilling.~n')
    ;   (   (water_sign(Sign1), earth_sign(Sign2));
            (earth_sign(Sign1), water_sign(Sign2))
        )
    ->  format('Earth and water signs complement each other well, with earth providing stability and water offering emotional depth.~n')
    ;   (   (fire_sign(Sign1), air_sign(Sign2));
            (air_sign(Sign1), fire_sign(Sign2))
        )
    ->  format('They share an optimism and curiosity about life, which ensures their time together is filled with exploration, laughter, and mutual growth.~n')
    ).

% Example usage of these predicates:
% ?- find_compatible_signs('Aries', CompatibleSigns).
% ?- compatibility_report('Aries', 'Leo').
