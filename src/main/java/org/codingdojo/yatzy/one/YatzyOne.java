package org.codingdojo.yatzy.one;

import java.util.Arrays;
import java.util.List;

public class YatzyOne {

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

    public static int four_of_a_kind(int _1, int _2, int d3, int d4, int d5)
    {
        int[] tallies;
        tallies = new int[6];
        tallies[_1-1]++;
        tallies[_2-1]++;
        tallies[d3-1]++;
        tallies[d4-1]++;
        tallies[d5-1]++;
        for (int i = 0; i < 6; i++)
            if (tallies[i] >= 4)
                return (i+1) * 4;
        return 0;
    }


    public static int smallStraight(int d1, int d2, int d3, int d4, int d5)
    {
        int[] tallies;
        tallies = new int[6];
        tallies[d1-1] += 1;
        tallies[d2-1] += 1;
        tallies[d3-1] += 1;
        tallies[d4-1] += 1;
        tallies[d5-1] += 1;
        if (tallies[0] == 1 &&
            tallies[1] == 1 &&
            tallies[2] == 1 &&
            tallies[3] == 1 &&
            tallies[4] == 1)
            return 15;
        return 0;
    }

    public static int largeStraight(int d1, int d2, int d3, int d4, int d5)
    {
        int[] tallies;
        tallies = new int[6];
        tallies[d1-1] += 1;
        tallies[d2-1] += 1;
        tallies[d3-1] += 1;
        tallies[d4-1] += 1;
        tallies[d5-1] += 1;
        if (tallies[1] == 1 &&
            tallies[2] == 1 &&
            tallies[3] == 1 &&
            tallies[4] == 1
            && tallies[5] == 1)
            return 20;
        return 0;
    }

    public static int fullHouse(int d1, int d2, int d3, int d4, int d5)
    {
        int[] tallies;
        boolean _2 = false;
        int i;
        int _2_at = 0;
        boolean _3 = false;
        int _3_at = 0;




        tallies = new int[6];
        tallies[d1-1] += 1;
        tallies[d2-1] += 1;
        tallies[d3-1] += 1;
        tallies[d4-1] += 1;
        tallies[d5-1] += 1;

        for (i = 0; i != 6; i += 1)
            if (tallies[i] == 2) {
                _2 = true;
                _2_at = i+1;
            }

        for (i = 0; i != 6; i += 1)
            if (tallies[i] == 3) {
                _3 = true;
                _3_at = i+1;
            }

        if (_2 && _3)
            return _2_at * 2 + _3_at * 3;
        else
            return 0;
    }
}



