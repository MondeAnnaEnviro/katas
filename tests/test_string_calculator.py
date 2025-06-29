from calculator.string_calculator import add
import pytest


def test_empty_string():
    assert add( "" ) == 0


def test_single_number():
    assert add( "5" ) == 5


def test_two_numbers():
    assert add( "30,4" ) == 34


def test_n_numbers():
    assert add( "1,2,3,4" ) == 10


def test_newline_as_delimiter():
    assert add( "30,20\n5" ) == 55


def test_user_delimiter():
    assert add( "//;\n1;2" ) == 3


def test_negatives_throw():
    match = "negatives not allowed: -1, -2"
    with pytest.raises( ValueError, match=match):
        add( "-1,-2" )
