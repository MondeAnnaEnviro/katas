from calculator.string_calculator import add
import pytest


def test_empty_string():
    add( "" ) == 0


def test_single_numbers():
    add( "65" ) == 65


def test_two_numbers():
    add( "23,32" ) == 55


def test_n_numbers():
    add( "2,3,3,2" ) == 10


def test_newline_as_delimiter():
    add( "1,2\n3" ) == 6


def test_user_delim():
    add ( "//;\n1;2" ) == 3
