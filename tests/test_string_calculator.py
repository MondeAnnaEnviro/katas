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


def test_user_delim():
    assert add( "//*\n1*2" ) == 3
