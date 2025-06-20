package org.codingdojo.yatzy.one;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import org.junit.jupiter.api.Test;


public class YatzyOneTest {

    @Test
    public void chanceSumsAllDice(){
        assertThat( new YatzyOne( 2, 3, 4, 5, 1 ).chance() ).isEqualTo( 15 );
        assertThat( new YatzyOne( 3, 3, 4, 5, 1 ).chance() ).isEqualTo( 16 );
    }

    @Test
    public void yatzyScoresEqualFacesFifty(){
        assertThat( new YatzyOne( 4, 4, 4, 4, 4 ).yatzy() ).isEqualTo( 50 );
        assertThat( new YatzyOne( 6, 6, 6, 6, 3 ).yatzy() ).isEqualTo(  0 );
    }

    @Test
    public void sumOnes(){
        assertThat( new YatzyOne( 1, 2, 3, 4, 5 ).ones() ).isEqualTo( 1 );
        assertThat( new YatzyOne( 1, 2, 1, 4, 5 ).ones() ).isEqualTo( 2 );
        assertThat( new YatzyOne( 6, 2, 2, 4, 5 ).ones() ).isEqualTo( 0 );
        assertThat( new YatzyOne( 1, 2, 1, 1, 1 ).ones() ).isEqualTo( 4 );
    }

    @Test
    public void sumTwos(){
        assertThat( new YatzyOne( 1, 2, 3, 2, 6 ).twos() ).isEqualTo(  4 );
        assertThat( new YatzyOne( 2, 2, 2, 2, 2 ).twos() ).isEqualTo( 10 );
    }

    @Test
    public void sumThrees(){
        assertThat( new YatzyOne( 1, 2, 3, 2, 3 ).threes() ).isEqualTo(  6 );
        assertThat( new YatzyOne( 2, 3, 3, 3, 3 ).threes() ).isEqualTo( 12 );
    }

    @Test
    public void sumFours(){
        assertThat( new YatzyOne( 4, 4, 4, 5, 5 ).fours() ).isEqualTo( 12 );
        assertThat( new YatzyOne( 4, 4, 5, 5, 5 ).fours() ).isEqualTo(  8 );
        assertThat( new YatzyOne( 4, 5, 5, 5, 5 ).fours() ).isEqualTo(  4 );
    }

    @Test
    public void sumFives(){
        assertThat( new YatzyOne( 4, 4, 4, 5, 5 ).fives() ).isEqualTo( 10 );
        assertThat( new YatzyOne( 4, 4, 5, 5, 5 ).fives() ).isEqualTo( 15 );
        assertThat( new YatzyOne( 4, 5, 5, 5, 5 ).fives() ).isEqualTo( 20 );
    }

    @Test
    public void sumSixes(){
        assertThat( new YatzyOne( 4, 4, 4, 5, 5 ).sixes() ).isEqualTo( 0 );
        assertThat( new YatzyOne( 4, 4, 6, 5, 5 ).sixes() ).isEqualTo( 6 );
        assertThat( new YatzyOne( 6, 5, 6, 6, 5 ).sixes() ).isEqualTo( 18 );
    }

    @Test
    public void sumOfHighestPair(){
        assertThat( new YatzyOne( 3, 4, 3, 5, 6 ).onePair() ).isEqualTo(  6 );
        assertThat( new YatzyOne( 5, 3, 3, 3, 5 ).onePair() ).isEqualTo( 10 );
        assertThat( new YatzyOne( 5, 3, 6, 6, 5 ).onePair() ).isEqualTo( 12 );
    }

    @Test
    public void sumOfTwoHighestPairs(){
        assertThat( new YatzyOne( 3, 3, 5, 4, 5 ).twoPairs() ).isEqualTo( 16 );
        assertThat( new YatzyOne( 3, 3, 5, 5, 5 ).twoPairs() ).isEqualTo( 16 );
    }

    @Test
    public void sumThreeOfKind(){
        assertThat( new YatzyOne( 5, 3, 5, 4, 5 ).threeOfKind() ).isEqualTo( 15 );
        assertThat( new YatzyOne( 3, 3, 3, 4, 5 ).threeOfKind() ).isEqualTo(  9 );
        assertThat( new YatzyOne( 3, 3, 3, 3, 5 ).threeOfKind() ).isEqualTo(  9 );
        assertThat( new YatzyOne( 3, 3, 3, 3, 3 ).threeOfKind() ).isEqualTo(  9 );
    }

    @Test
    public void four_of_a_knd() {
        assertThat( new YatzyOne( 3, 3, 3, 3, 5 ).fourOfKind() ).isEqualTo( 12 );
        assertThat( new YatzyOne( 5, 5, 5, 4, 5 ).fourOfKind() ).isEqualTo( 20 );
    }

    @Test
    public void smallStraight(){
        assertThat( new YatzyOne( 1,2,3,4,5 ).smallStraight() ).isEqualTo( 15 );
        assertThat( new YatzyOne( 2,3,4,5,1 ).smallStraight() ).isEqualTo( 15 );
        assertThat( new YatzyOne( 1,2,2,4,5 ).smallStraight() ).isEqualTo(  0 );
    }

    @Test
    public void largeStraight() {
        assertEquals(20, YatzyOne.largeStraight(6,2,3,4,5));
        assertEquals(20, YatzyOne.largeStraight(2,3,4,5,6));
        assertEquals(0, YatzyOne.largeStraight(1,2,2,4,5));
    }

    @Test
    public void fullHouse() {
        assertEquals(18, YatzyOne.fullHouse(6,2,2,2,6));
        assertEquals(0, YatzyOne.fullHouse(2,3,4,5,6));
    }
}
