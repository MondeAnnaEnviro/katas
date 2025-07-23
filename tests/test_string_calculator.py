from calculator.string_calculator import add
import pytest


def test_empty_str():
    assert add("") == 0


def test_one_number():
    assert add("1") == 1


def test_two_numbers():
    assert add("1,2") == 3

def test_n_numbers():
    assert add("1,2,3") == 6


def test_newline():
    assert add("1,2\n3") == 6


def test_ignore_nums_greater_than_1000():
    assert add("1,1001") == 1


def test_user_delim():
    assert add("//;\n1;2") == 3


def test_var_len_user_delim():
    assert add("//[!!]\n1!!2") == 3


def test_multiple_user_delims():
    assert add("//[!][@]\n1!2@3") == 6


def test_multiple_var_len_user_delims():
    assert add("//[!][@@][###]\n1!2@@3###4") == 10


def test_negative_numbers():
    match_ = "negatives not allowed: -1, -2"
    with pytest.raises( ValueError, match=match_):
        add("-1,-2")