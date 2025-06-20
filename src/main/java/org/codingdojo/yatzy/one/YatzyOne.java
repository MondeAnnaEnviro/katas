package org.codingdojo.yatzy.one;

import java.util.Arrays;
import java.util.List;

public class YatzyOne {

    private final int LARGE_STRAIGHT = 20;
    private final int SMALL_STRAIGHT = 15;
    private final int NUM_OF_SIDES = 6;
    private final int FIFTY = 50;
    private final int ZERO = 0;

    private List<Integer> dice;
    protected Integer[] diceArray;

    public YatzyOne(){}

    public YatzyOne( Integer... dice ){
        this.dice = Arrays.asList( dice );
        this.diceArray = dice;
    }

    public int chance(){
        return dice.stream()
            .mapToInt( Integer::valueOf )
            .sum();
    }

    public int yatzy(){
        int num = dice.get( 0 );
        int size = dice.size();
        boolean hasSameNum = chance() / num == size;

        return ( hasSameNum ? FIFTY : ZERO );
    }

    public int ones(){
        return filteredSum( 1 );
    }

    public int twos(){
        return filteredSum( 2 );
    }

    public int threes(){
        return filteredSum( 3 );
    }

    public int fours(){
        return filteredSum( 4 );
    }

    public int fives(){
        return filteredSum( 5 );
    }

    public int sixes(){
        return filteredSum( 6 );
    }

    public int onePair(){
        int[] counts = getCounts();

        for ( int at = 0; at < NUM_OF_SIDES; at++ )
            if ( counts[ NUM_OF_SIDES - at - 1 ] >= 2 )
                return ( NUM_OF_SIDES - at ) * 2;
        return 0;
    }

    public int twoPairs(){
        int[] counts = getCounts();
        int score = 0;
        int n = 0;

        for ( int at = 0; at < NUM_OF_SIDES; at++ )
            if ( counts[ NUM_OF_SIDES - at - 1 ] >= 2 ){
                n++;
                score += NUM_OF_SIDES - at;
            }

        if ( n == 2 )
            return score * 2;
        return 0;
    }

    public int threeOfKind(){
        int[] counts = getCounts();

        for ( int at = 0; at < NUM_OF_SIDES; at++ )
            if ( counts[ at ] >= 3 )
                return ( at + 1 ) * 3;
        return 0;
    }

    public int fourOfKind(){
        int[] counts = getCounts();

        for ( int at = 0; at < NUM_OF_SIDES; at++ )
            if ( counts[ at ] >= 4 )
                return ( at + 1 ) * 4;
        return 0;
    }

    public int smallStraight(){
        return chance() == SMALL_STRAIGHT
            ? SMALL_STRAIGHT
            : ZERO;
    }

    public int largeStraight(){
        return chance() == LARGE_STRAIGHT
            ? LARGE_STRAIGHT
            : ZERO;
    }

    public int fullHouse(){
        int[] counts = getCounts();

        boolean isPair = false;
        int valueOfPair = 0;

        boolean isTriple = false;
        int valueOfTriple = 0;

        for ( int at = 0; at < NUM_OF_SIDES; at++ )
            if ( counts[ at ] == 2 ){
                isPair = true;
                valueOfPair = at + 1;
            }

        for ( int at = 0; at < NUM_OF_SIDES; at++ )
            if ( counts[ at ] == 3 ){
                isTriple = true;
                valueOfTriple = at + 1;
            }

        return isPair && isTriple
            ? valueOfPair * 2 + valueOfTriple * 3
            : ZERO;
    }

    private int filteredSum( int filter ){
        return dice.stream()
            .mapToInt( Integer::valueOf )
            .filter( integer -> integer == filter )
            .sum();
    }

    private int[] getCounts(){
        int[] counts = new int[ NUM_OF_SIDES ];

        for ( int die : diceArray )
            counts[ die - 1 ]++;

        return counts;
    }
}
