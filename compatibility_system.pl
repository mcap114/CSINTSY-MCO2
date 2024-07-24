% compatibility_system.pl

% Facts: Compatibility between zodiac signs
compatible('Aries', 'Leo', 'Aries and Leo are both fiery and enthusiastic, making for a passionate relationship.').
compatible('Aries', 'Sagittarius', 'Aries and Sagittarius, being both fire signs, can handle each other\'s fiery energy.').
compatible('Taurus', 'Virgo', 'Pragmatic Virgo is enchanted by Taurus\' Venusian qualities and admire their awareness of life\'s luxuries.').
compatible('Taurus', 'Capricorn', 'Taurus and Capricorn appreciate each other\'s sense of discipline and intricacy.').
compatible('Gemini', 'Libra', 'Like-minded air signs like Libra appreciate Gemini\'s clever wit and vivacious intellectualism.').
compatible('Gemini', 'Aquarius', 'Gemini and Aquarius both share the need for adventure.').
compatible('Cancer', 'Scorpio', 'Cancer and Scorpio both excel at all forms of communication (even psychic).').
compatible('Cancer', 'Pisces', 'Fellow water sign Pisces effectively establish a sense of loyalty and trust towards each other.').
compatible('Leo', 'Aries', 'Fellow fire signs Leo and Aries appreciate their magnetic charisma and burning passion.').
compatible('Leo', 'Sagittarius', 'Leo and Sagittarius easily get along due to their fiery and outgoing nature.').
compatible('Virgo', 'Taurus', 'Virgo and Taurus feel most grounded and stable due to their shared intelligent nature.').
compatible('Virgo', 'Capricorn', 'As fellow earth signs, Virgo and Capricorn find it easy to communicate through logic and rational thinking.').
compatible('Libra', 'Gemini', 'Libra and Gemini appreciate each other\'s aesthetic and charming nature.').
compatible('Libra', 'Aquarius', 'Libra and Aquarius enjoy cultivating their own artistic tastes in a relationship.').
compatible('Scorpio', 'Cancer', 'Cancer appreciates Scorpio\'s determination in fulfilling their life goals.').
compatible('Scorpio', 'Pisces', 'Scorpio and Pisces love to work together with a sense of fulfillment and trust.').
compatible('Sagittarius', 'Aries', 'Sagittarius are known for their fiery drive for thrills and Aries pairs well with this energy.').
compatible('Sagittarius', 'Leo', 'Sagittarius and Leo enjoy each other\'s fiery nature and perfectly complement each other.').
compatible('Capricorn', 'Taurus', 'Taurus appreciates the sense of security they get from Capricorns and their hard-working nature.').
compatible('Capricorn', 'Virgo', 'Like-minded earth signs benefit from each other\'s dedication and drive to live a stable life.').
compatible('Aquarius', 'Gemini', 'Gemini appreciates Aquarius\' big-picture thinking, pushing Gemini to explore them.').
compatible('Aquarius', 'Libra', 'Aquarius and Libra both share a high-level of thinking and appreciate each other\'s lighthearted intellectualism.').
compatible('Pisces', 'Cancer', 'Pisces and their open-mindedness can allow for a very emotionally successful relationship with Cancer.').
compatible('Pisces', 'Scorpio', 'Scorpio respects the creativity and flexibility of Pisces, allowing for a versatile relationship.').

% Rule: Check if two zodiac signs are compatible
relationship_compatibility(Sign1, Sign2, Description) :-
    compatible(Sign1, Sign2, Description);
    compatible(Sign2, Sign1, Description).

% Query example:
% ?- relationship_compatibility('Aries', 'Leo', Description).
% This will return true if Aries and Leo are compatible and will provide the description.