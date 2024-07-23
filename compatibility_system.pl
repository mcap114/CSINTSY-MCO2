% compatibility_system.pl

% Facts: Compatibility between zodiac signs
compatible('Aries', 'Leo').
compatible('Aries', 'Sagittarius').
compatible('Taurus', 'Virgo').
compatible('Taurus', 'Capricorn').
compatible('Gemini', 'Libra').
compatible('Gemini', 'Aquarius').
compatible('Cancer', 'Scorpio').
compatible('Cancer', 'Pisces').
compatible('Leo', 'Aries').
compatible('Leo', 'Sagittarius').
compatible('Virgo', 'Taurus').
compatible('Virgo', 'Capricorn').
compatible('Libra', 'Gemini').
compatible('Libra', 'Aquarius').
compatible('Scorpio', 'Cancer').
compatible('Scorpio', 'Pisces').
compatible('Sagittarius', 'Aries').
compatible('Sagittarius', 'Leo').
compatible('Capricorn', 'Taurus').
compatible('Capricorn', 'Virgo').
compatible('Aquarius', 'Gemini').
compatible('Aquarius', 'Libra').
compatible('Pisces', 'Cancer').
compatible('Pisces', 'Scorpio').

% Rule: Check if two zodiac signs are compatible
relationship_compatibility(Sign1, Sign2) :-
    compatible(Sign1, Sign2);
    compatible(Sign2, Sign1).

% Query example:
% ?- relationship_compatibility('Aries', 'Leo').
% This will return true if Aries and Leo are compatible, false otherwise.
