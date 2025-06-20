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
    public void fours_test() 
    {
        assertEquals(12, new YatzyOne(4,4,4,5,5).fours());
        assertEquals(8, new YatzyOne(4,4,5,5,5).fours());
        assertEquals(4, new YatzyOne(4,5,5,5,5).fours());
    }

    @Test
    public void fives() {
        assertEquals(10, new YatzyOne(4,4,4,5,5).fives());
        assertEquals(15, new YatzyOne(4,4,5,5,5).fives());
        assertEquals(20, new YatzyOne(4,5,5,5,5).fives());
    }

    @Test
    public void sixes_test() {
        assertEquals(0, new YatzyOne(4,4,4,5,5).sixes());
        assertEquals(6, new YatzyOne(4,4,6,5,5).sixes());
        assertEquals(18, new YatzyOne(6,5,6,6,5).sixes());
    }

    @Test
    public void one_pair() {
        assertEquals(6, new YatzyOne().score_pair(3,4,3,5,6));
        assertEquals(10, new YatzyOne().score_pair(5,3,3,3,5));
        assertEquals(12, new YatzyOne().score_pair(5,3,6,6,5));
    }

    @Test
    public void two_Pair() {
        assertEquals(16, YatzyOne.two_pair(3,3,5,4,5));
        assertEquals(16, YatzyOne.two_pair(3,3,5,5,5));
    }

    @Test
    public void three_of_a_kind() 
    {
        assertEquals(9, YatzyOne.three_of_a_kind(3,3,3,4,5));
        assertEquals(15, YatzyOne.three_of_a_kind(5,3,5,4,5));
        assertEquals(9, YatzyOne.three_of_a_kind(3,3,3,3,5));
    }

    @Test
    public void four_of_a_knd() {
        assertEquals(12, YatzyOne.four_of_a_kind(3,3,3,3,5));
        assertEquals(20, YatzyOne.four_of_a_kind(5,5,5,4,5));
        assertEquals(9, YatzyOne.three_of_a_kind(3,3,3,3,3));
    }

    @Test
    public void smallStraight() {
        assertEquals(15, YatzyOne.smallStraight(1,2,3,4,5));
        assertEquals(15, YatzyOne.smallStraight(2,3,4,5,1));
        assertEquals(0, YatzyOne.smallStraight(1,2,2,4,5));
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
