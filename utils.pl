% utils.pl

% Helper predicate to check if a zodiac sign is valid
valid_zodiac_sign(Sign) :-
    member(Sign, ['Aries', 'Taurus', 'Gemini', 'Cancer', 'Leo', 'Virgo',
                   'Libra', 'Scorpio', 'Sagittarius', 'Capricorn', 'Aquarius', 'Pisces']).

% Helper predicate to list all zodiac signs
list_zodiac_signs(Signs) :-
    Signs = ['Aries', 'Taurus', 'Gemini', 'Cancer', 'Leo', 'Virgo',
             'Libra', 'Scorpio', 'Sagittarius', 'Capricorn', 'Aquarius', 'Pisces'].

% Predicate to find compatible signs for a given sign
find_compatible_signs(Sign, CompatibleSigns) :-
    valid_zodiac_sign(Sign),
    findall(
        CompSign, 
        (compatible(Sign, CompSign)),
        CompatibleSigns
    ),
    % Print the compatible signs array
    format('Compatible signs for ~w: ~w~n~n', [Sign, CompatibleSigns]),

    % Print the compatibility descriptions
    print_compatibility_details(CompatibleSigns, Sign).

% Predicate to print compatibility descriptions for each compatible sign
print_compatibility_details([], _).
print_compatibility_details([Head|Tail], Sign) :-
    (   compatible(Sign, Head)
    ->  format('~w and ~w are compatible: ~n', [Sign, Head]),
        compatibility_description(Sign, Head),
        format('~n'),
        print_compatibility_details(Tail, Sign)
    ;   print_compatibility_details(Tail, Sign)
    ).

% Predicate to provide a compatibility report for a given pair of signs and their description
compatibility_report(Sign1, Sign2, Report) :-
    (   valid_zodiac_sign(Sign1),
        valid_zodiac_sign(Sign2)
    ->  (   relationship_compatibility(Sign1, Sign2)
        ->  (   compatibility_description(Sign1, Sign2, Description),
                format('~w and ~w are compatible.~nDescription: ~w~n', [Sign1, Sign2, Description]),
                Report = Description
            )
        ;   (   relationship_incompatibility(Sign1, Sign2)
            ->  (   incompatibility_description(Sign1, Sign2, Description),
                    format('~w and ~w are incompatible.~nDescription: ~w~n', [Sign1, Sign2, Description]),
                    Report = Description
                )
            ;   format('~w and ~w have no specific compatibility or incompatibility defined.~n', [Sign1, Sign2]),
                Report = 'No specific compatibility or incompatibility defined.'
            )
        )
    ;   format('One or both of the signs are invalid.~n'),
        Report = 'Invalid sign(s).'
    ).

% Predicate to provide a description based on compatibility
compatibility_description(Sign1, Sign2, Description) :-
    (   fire_sign(Sign1),
        fire_sign(Sign2)
    ->  Description = 'They are both fire signs, which typically share energy, enthusiasm, and a dynamic approach to life.'
    ;   earth_sign(Sign1),
        earth_sign(Sign2)
    ->  Description = 'They are both earth signs, which typically share practical and stable qualities.'
    ;   air_sign(Sign1),
        air_sign(Sign2)
    ->  Description = 'They are both air signs, which typically share intellectual and communicative qualities.'
    ;   water_sign(Sign1),
        water_sign(Sign2)
    ->  Description = 'They are both water signs, meaning they find an intuitive understanding and emotional resonance that can be deeply fulfilling.'
    ;   (   (water_sign(Sign1), earth_sign(Sign2));
            (earth_sign(Sign1), water_sign(Sign2))
        )
    ->  Description = 'Earth and water signs complement each other well, with earth providing stability and water offering emotional depth.'
    ;   (   (fire_sign(Sign1), air_sign(Sign2));
            (air_sign(Sign1), fire_sign(Sign2))
        )
    ->  Description = 'They share an optimism and curiosity about life, which ensures their time together is filled with exploration, laughter, and mutual growth.'
    ).

% Predicate to provide a description based on incompatibility
incompatibility_description(Sign1, Sign2, Description) :-
    (   ((fire_sign(Sign1), water_sign(Sign2));
        (water_sign(Sign1), fire_sign(Sign2)))
    ->  Description = 'Fire signs are generally incompatible with water signs, as their differing elements may lead to conflict.'
    ;   ((earth_sign(Sign1), fire_sign(Sign2));
        (fire_sign(Sign1), earth_sign(Sign2)))
    ->  Description = 'Earth signs are generally incompatible with fire signs, due to differing approaches and values.'
    ;   ((water_sign(Sign1), air_sign(Sign2));
        (air_sign(Sign1), water_sign(Sign2)))
    ->  Description = 'Water signs are generally incompatible with air signs, as their emotional and intellectual needs may not align.'
    ;   ((air_sign(Sign1), earth_sign(Sign2));
        (earth_sign(Sign1), air_sign(Sign2)))
    ->  Description = 'Air signs are generally incompatible with earth signs, as their differing perspectives and priorities can create friction.'
    ).

% Example usage of these predicates:
% ?- find_compatible_signs('Aries', CompatibleSigns).
% ?- compatibility_report('Aries', 'Leo', Report).
