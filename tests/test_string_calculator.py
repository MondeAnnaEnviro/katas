from calculator.string_calculator import add
import pytest


def test_empty_string():
    add ( "" ) == 0


def test_single_numbers():
    add ( "65" ) == 65
