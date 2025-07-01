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
