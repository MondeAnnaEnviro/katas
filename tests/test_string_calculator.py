from calculator.string_calculator import add


def test_empty_string_returns_zero():
    assert add( "" ) == 0


def test_single_number_returned_as_int():
    assert add( "23" ) == 23
