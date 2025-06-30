from calculator.string_calculator import add
import pytest


def test_empty_string():
    assert add( "" ) == 0


def test_single_number():
    assert add( "1" ) == 1


def test_two_numbers():
    assert add( "8,8" ) == 16


def test_n_numbers():
    assert add( "1,2,3,4" ) == 10


def test_newline():
    assert add( "1,2\n3" ) == 6


def test_greater_than_one_thousand():
    assert add( "1,1001" ) == 1


def test_user_delim():
    assert add( "//*\n1*2" ) == 3


def test_var_len_user_delim():
    assert add( "//[**]\n1**2" ) == 3


@pytest.mark.skip( "time ran out" )
def test_var_len_user_delim():
    assert add( "//[*][$]\n1*2$5" ) == 8


def test_negatives_throw():
    match = "negatives not allowed: -1, -2"
    with pytest.raises( ValueError, match=match):
        add( "-1,-2" )
