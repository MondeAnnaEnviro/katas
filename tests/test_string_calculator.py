from calculator.string_calculator import add
import pytest


def test_empty_str_return_zero():
    assert add( "" ) == 0
