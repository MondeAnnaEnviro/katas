from calculator.string_calculator import add
import pytest


def test_empty_str_return_zero():
    assert add( "" ) == 0


def test_single_number():
    assert add( "34" ) == 34
