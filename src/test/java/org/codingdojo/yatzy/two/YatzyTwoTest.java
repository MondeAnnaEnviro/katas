package org.codingdojo.yatzy.two;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.List;

public class YatzyTwoTest {

    private YatzyTwo yatzyTwo;

    @BeforeEach
    public void setup(){
        yatzyTwo = new YatzyTwo();
    }

    @Test
    public void chance_scores_sum_of_all_dice(){
        assertThat( yatzyTwo.chance( List.of( 2, 3, 4, 5, 1 ))).isEqualTo( 15 );
        assertThat( yatzyTwo.chance( List.of( 3, 3, 4, 5, 1 ))).isEqualTo( 16 );
    }

    @Test
    public void yatzyScoresFify(){
        assertThat( yatzyTwo.yatzy( List.of( 4, 4, 4, 4, 4 ))).isEqualTo( 50 );
        assertThat( yatzyTwo.yatzy( List.of( 6, 6, 6, 6, 6 ))).isEqualTo( 50 );
        assertThat( yatzyTwo.yatzy( List.of( 6, 6, 6, 6, 3 ))).isEqualTo(  0 );
    }

    @Test
    public void sumOfOnes(){
        assertThat( yatzyTwo.ones( List.of( 1, 2, 3, 4, 5 ))).isEqualTo( 1 );
        assertThat( yatzyTwo.ones( List.of( 1, 2, 1, 4, 5 ))).isEqualTo( 2 );
        assertThat( yatzyTwo.ones( List.of( 6, 2, 2, 4, 5 ))).isEqualTo( 0 );
        assertThat( yatzyTwo.ones( List.of( 1, 2, 1, 1, 1 ))).isEqualTo( 4 );
    }

    @Test
    public void sumOfTwos(){
        assertThat( yatzyTwo.twos( List.of( 1, 2, 3, 2, 6 ))).isEqualTo(  4 );
        assertThat( yatzyTwo.twos( List.of( 2, 2, 2, 2, 2 ))).isEqualTo( 10 );
    }

    @Test
    public void sumOfThrees(){
        assertThat( yatzyTwo.threes( List.of( 1, 2, 3, 2, 3 ))).isEqualTo(  6 );
        assertThat( yatzyTwo.threes( List.of( 2, 3, 3, 3, 3 ))).isEqualTo( 12 );
    }

    @Test
    public void sumOfFours(){
        assertThat( yatzyTwo.fours( List.of( 4, 4, 4, 5, 5 ))).isEqualTo( 12 );
        assertThat( yatzyTwo.fours( List.of( 4, 4, 5, 5, 5 ))).isEqualTo(  8 );
        assertThat( yatzyTwo.fours( List.of( 4, 5, 5, 5, 5 ))).isEqualTo(  4 );
    }

    @Test
    public void sumOfFives(){
        assertThat( yatzyTwo.fives( List.of( 4, 4, 4, 5, 5 ))).isEqualTo( 10 );
        assertThat( yatzyTwo.fives( List.of( 4, 4, 5, 5, 5 ))).isEqualTo( 15 );
        assertThat( yatzyTwo.fives( List.of( 4, 5, 5, 5, 5 ))).isEqualTo( 20 );
    }

    @Test
    public void sumOfSixes(){
        assertThat( yatzyTwo.sixes( List.of( 4, 4, 4, 5, 5 ))).isEqualTo(  0 );
        assertThat( yatzyTwo.sixes( List.of( 4, 4, 6, 5, 5 ))).isEqualTo(  6 );
        assertThat( yatzyTwo.sixes( List.of( 6, 5, 6, 6, 5 ))).isEqualTo( 18 );
    }

    @Test
    public void sumHighestPair(){
        assertThat( yatzyTwo.pair( List.of( 3, 4, 3, 5, 6 ))).isEqualTo(  6 );
        assertThat( yatzyTwo.pair( List.of( 5, 3, 3, 3, 5 ))).isEqualTo( 10 );
        assertThat( yatzyTwo.pair( List.of( 5, 3, 6, 6, 5 ))).isEqualTo( 12 );
    }

    @Test
    public void sumOfTwoPairs(){
        assertThat( yatzyTwo.twoPairs( List.of( 3, 3, 5, 4, 5 ))).isEqualTo( 16 );
        assertThat( yatzyTwo.twoPairs( List.of( 3, 3, 5, 5, 5 ))).isEqualTo( 16 );
    }

    @Test
    public void sumThreeOfKind(){
        assertThat( yatzyTwo.threeOfKind( List.of( 3, 3, 3, 4, 5 ))).isEqualTo(  9 );
        assertThat( yatzyTwo.threeOfKind( List.of( 5, 3, 5, 4, 5 ))).isEqualTo( 15 );
        assertThat( yatzyTwo.threeOfKind( List.of( 3, 3, 3, 3, 5 ))).isEqualTo(  9 );
    }

    @Test
    public void four_of_a_knd(){
        assertEquals(12, yatzyTwo.score(List.of(3,3,3,3,5), "FOUR_OF_A_KIND"));
        assertEquals(20, yatzyTwo.score(List.of(5,5,5,4,5), "FOUR_OF_A_KIND"));
        assertEquals(12, yatzyTwo.score(List.of(3,3,3,3,3), "FOUR_OF_A_KIND"));
    }

    @Test
    public void smallStraight(){
        assertEquals(15, yatzyTwo.score(List.of(1,2,3,4,5), "SMALL_STRAIGHT"));
        assertEquals(15, yatzyTwo.score(List.of(2,3,4,5,1), "SMALL_STRAIGHT"));
        assertEquals(0, yatzyTwo.score(List.of(1,2,2,4,5), "SMALL_STRAIGHT"));
    }

    @Test
    public void largeStraight(){
        assertEquals(20, yatzyTwo.score(List.of(6,2,3,4,5), "LARGE_STRAIGHT"));
        assertEquals(20, yatzyTwo.score(List.of(2,3,4,5,6), "LARGE_STRAIGHT"));
        assertEquals(0, yatzyTwo.score(List.of(1,2,2,4,5), "LARGE_STRAIGHT"));
    }

    @Test
    public void fullHouse(){
        assertEquals(18, yatzyTwo.score(List.of(6,2,2,2,6), "FULL_HOUSE"));
        assertEquals(0, yatzyTwo.score(List.of(2,3,4,5,6), "FULL_HOUSE"));
    }
}
