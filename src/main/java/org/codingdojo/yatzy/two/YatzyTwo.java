package org.codingdojo.yatzy.two;

import org.codingdojo.YatzyCalculator;
import org.codingdojo.YatzyCategory;

import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class YatzyTwo implements YatzyCalculator {

    static final List<Integer> DICE_VALUES = Arrays.asList(6, 5, 4, 3, 2, 1);

    public int chance( List<Integer> dice ){
        return dice.stream()
                .mapToInt( Integer::valueOf )
                .sum();
    }

    public int ones( List<Integer> dice ){
        return filteredSum( dice, 1 );
    }

    public int twos( List<Integer> dice ){
        return filteredSum( dice, 2 );
    }

    public int threes( List<Integer> dice ){
        return filteredSum( dice, 3 );
    }

    public int fours( List<Integer> dice ){
        return filteredSum( dice, 4 );
    }

    public int fives( List<Integer> dice ){
        return filteredSum( dice, 5 );
    }

    public int sixes( List<Integer> dice ){
        return filteredSum( dice, 6 );
    }

    public int pair( List<Integer> dice ){
        return ofKind( dice, 2 );
    }

    public int twoPairs( List<Integer> dice ){
        int twoPairResult = 0;
        long pairCount = 0L;

        for ( Map.Entry<Integer, Integer> entry : diceFrequencies( dice ).entrySet() )
            if ( entry.getValue() >= 2 )
                pairCount++;

        if ( pairCount == 2 )
            for ( int die : DICE_VALUES )
                if ( diceFrequencies( dice ).get( die ) >= 2 )
                    twoPairResult +=  die * 2;

        return twoPairResult;
    }

    public int threeOfKind( List<Integer> dice ){
        return ofKind( dice, 3 );
    }

    public int fourOfKind( List<Integer> dice ){
        return ofKind( dice, 4 );
    }

    public int smallStraight( List<Integer> dice ){
        return new HashSet<>( dice ).size() == 5 && !dice.contains( 6 )
                ? 15
                : 0;
    }

    public int largeStraight( List<Integer> dice ){
        return new HashSet<>( dice ).size() == 5 && !dice.contains( 1 )
                ? 20
                : 0;
    }

    public int yatzy( List<Integer> dice ){
        return chance( dice ) / dice.size() == dice.get( 0 )
            ? 50
            : 0;
    }

    @Override
    public List<String> validCategories() {
        return Arrays.stream(YatzyCategory.values()).map(Enum::toString).collect(Collectors.toList());
    }

    @Override
    public int score(List<Integer> dice, String categoryName) {
        YatzyCategory category = YatzyCategory.valueOf(categoryName);

        // calculate dice frequencies
        HashMap<Integer, Integer> diceFrequencies = new HashMap<>();
        for (int i : DICE_VALUES) {
            diceFrequencies.put(i, 0);
        }
        for (int die : dice) {
            diceFrequencies.put(die, diceFrequencies.get(die) + 1);
        }

        // calculate the score
        int result;
        switch (category) {
            case FULL_HOUSE:

                // score if there is a pair as well as three of a kind
                int fullHouseResult = 0;
                if (diceFrequencies.containsValue(2) && diceFrequencies.containsValue(3)) {
                    for (Integer die : dice) {
                        fullHouseResult += die;
                    }
                }
                result = fullHouseResult;
                break;

            default:
                result = 0;
        }
        return result;
    }

    private Map<Integer, Integer> diceFrequencies( List<Integer> dice ){
        return Map.of(
            6, sixes( dice )  / 6,
            5, fives( dice )  / 5,
            4, fours( dice )  / 4,
            3, threes( dice ) / 3,
            2, twos( dice )   / 2,
            1, ones( dice )
        );
    }

    private int filteredSum( List<Integer> dice, Integer filter ){
        return dice.stream()
                .mapToInt( Integer::valueOf )
                .filter( integer -> integer == filter )
                .sum();
    }

    private int ofKind( List<Integer> dice, Integer frequency ){
        for ( int die : DICE_VALUES )
            if ( diceFrequencies( dice ).get( die ) >= frequency )
                return die * frequency;
        return 0;
    }
}
