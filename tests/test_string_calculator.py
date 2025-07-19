from calculator.string_calculator import add
import pytest


def test_empty_string():
    assert add( "" ) == 0


def test_one_number():
    assert add( "1" ) == 1


def test_two_numbers():
    assert add( "1,2" ) == 3


def test_n_numbers():
    assert add( "1,2,3" ) == 6


def test_newline():
    assert add( "1,2\n3" ) == 6


def test_single_delimiter():
    assert add( "//;\n1;2" ) == 3


def test_negatives():
    match = "negatives not allowed: -1, -2"
    with pytest.raises( ValueError, match=match ):
        add( "-1,-2" )

def test_no_num_greater_than_one_thousand():
    assert add( "1,1001" ) == 1


def test_var_len_single_delim():
    assert add( "//[!!]\n1!!2" ) == 3


def test_multi_delims():
    assert add( "//[!][@]\n1!2@3" ) == 6


def test_multi_var_len_delims():
    assert add( "//[!][@@][$$$]\n1!2@@3$$$4" ) == 10
