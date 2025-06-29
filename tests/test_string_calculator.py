from calculator.string_calculator import add
import pytest


def test_empty_string():
    assert add( "" ) == 0


def test_single_number():
    assert add( "5" ) == 5

def test_two_numbers():
    assert add( "30,4" ) == 34
