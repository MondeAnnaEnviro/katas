from calculator.string_calculator import add
import pytest



def test_empty_str():
    assert add( "" ) == 0


def test_one_number():
    assert add( "44" ) == 44


def test_two_numbers():
    assert add( "4,4") == 8
