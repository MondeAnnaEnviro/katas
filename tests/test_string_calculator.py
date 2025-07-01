from calculator.string_calculator import add
import pytest


def test_empty_str_return_zero():
    assert add( "" ) == 0


def test_single_number():
    assert add( "34" ) == 34


def test_two_numbers():
    assert add( "3,4" ) == 7


def test_n_numbers():
    assert add( "3,4,5,6" ) == 18


def test_newline():
    assert add( "1,2\n3" ) == 6


def test_only_n_at_1000_or_less():
    assert add( "1,1001" ) == 1


def test_negatives_throw():
    match = "negatives not allowed: -10, -9"
    with pytest.raises( ValueError, match=match ):
        add( "-10,-9" )


def test_user_delim():
    assert add( "//;\n3;2" ) == 5


