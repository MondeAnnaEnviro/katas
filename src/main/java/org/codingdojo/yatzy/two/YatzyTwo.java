package org.codingdojo.yatzy.two;

import org.codingdojo.YatzyCalculator;
import org.codingdojo.YatzyCategory;

import java.util.Arrays;
import java.util.HashMap;
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
        for ( int die : DICE_VALUES )
            if ( diceFrequencies( dice ).get( die ) >= 2 )
                return die * 2;
        return 0;
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
            case THREE_OF_A_KIND:

                // score if three dice are the same
                int threeKindResult = 0;
                for (int i : DICE_VALUES) {
                    if (diceFrequencies.get(i) >= 3) {
                        threeKindResult = i * 3;
                        break;
                    }
                }
                result = threeKindResult;
                break;

            case FOUR_OF_A_KIND:

                // score if four dice are the same
                int fourKindResult = 0;
                for (int i : DICE_VALUES) {
                    if (diceFrequencies.get(i) >= 4) {
                        fourKindResult = i * 4;
                        break;
                    }
                }
                result = fourKindResult;
                break;

            case SMALL_STRAIGHT:

                // score if dice contains 1,2,3,4,5
                int smallStraightResult = 0;
                long count = 0L;
                for (Integer frequency : diceFrequencies.values()) {
                    if (frequency == 1) {
                        count++;
                    }
                }
                if (count == 5 && diceFrequencies.get(6) == 0) {
                    for (Integer die : dice) {
                        smallStraightResult += die;
                    }
                }
                result = smallStraightResult;
                break;

            case LARGE_STRAIGHT:

                // score if dice contains 2,3,4,5,6
                int largeStraightResult = 0;
                long straightCount = 0L;
                for (Integer frequency : diceFrequencies.values()) {
                    if (frequency == 1) {
                        straightCount++;
                    }
                }
                if (straightCount == 5 && diceFrequencies.get(1) == 0) {
                    for (Integer die : dice) {
                        largeStraightResult += die;
                    }
                }
                result = largeStraightResult;
                break;

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

    private int filteredSum( List<Integer> dice, Integer filter ){
        return dice.stream()
                .mapToInt( Integer::valueOf )
                .filter( integer -> integer == filter )
                .sum();
    }
}
