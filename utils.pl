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
    ).

% Predicate to provide a compatibility report for a given pair of signs and their description
compatibility_report(Sign1, Sign2) :-
    (   valid_zodiac_sign(Sign1),
        valid_zodiac_sign(Sign2)
    ->  (   relationship_compatibility(Sign1, Sign2); relationship_incompatibility(Sign1,Sign2)
        )
    ).

% Example usage of these predicates:
% ?- find_compatible_signs('Aries', CompatibleSigns).
% ?- compatibility_report('Aries', 'Leo', Report).
