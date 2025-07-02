from calculator.string_calculator import add
import pytest



def test_empty_str():
    assert add( "" ) == 0


def test_one_number():
    assert add( "44" ) == 44


def test_two_numbers():
    assert add( "4,4") == 8


def test_n_numbers():
    assert add( "1,2,3,4" ) == 10


def test_newline():
    assert add( "1,2\n7" ) == 10


def test_greater_than_one_thousand_ignored():
    assert add( "1,1001" ) == 1


def test_negatives_throw():
    match = "negatives not allowed: -1, -2"
    with pytest.raises( ValueError, match=match ):
        add( "-1,-2" )


def test_user_delim():
    assert add( "//;\n5;5" ) == 10


def test_var_len_user_delim():
    assert add( "//[;;]\n5;;5;;5" ) == 15


def test_multi_user_delim():
    assert add( "//[;][#]\n5;5#4" ) == 14
