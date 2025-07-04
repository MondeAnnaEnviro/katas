from calculator.string_calculator import add
import pytest


def test_empty_string_is_zero():
    assert add( "" ) == 0


def test_single_num_returned_as_int():
    assert add( "54" ) == 54


def test_two_nums_returned_as_int_sum():
    assert add( "66,4" ) == 70


def test_n_numbers_retuned_as_int_sum():
    assert add( "1,2,3,4,5" ) == 15


def test_newline_as_delimiter():
    assert add( "1,2\n3" ) == 6


def test_ignore_numbers_greater_than_one_thousand():
    assert add( "1,1001" ) == 1


def test_user_delimiter():
    assert add( "//*\n1*99" ) == 100


def test_var_len_user_delimiter():
    assert add( "//[***]\n1***9***9" ) == 19


def test_multiple_user_delimiters():
    assert add( "//[*][/]\n55/5*7" ) == 67


def test_multiple_var_len_user_delimiters():
    assert add( "//[*][//][(((]\n5(((5*5//5" ) == 20


def test_negative_numbers_throw():
    match = "negatives not allowed: -1, -2"
    with pytest.raises( ValueError, match=match ):
        add( "-1,-2" )
