from calculator.string_calculator import add


def test_empty_string_returns_zero():
    assert add( "" ) == 0


def test_single_number_returned_as_int():
    assert add( "23" ) == 23


def test_doubley_numbered_string_returns_sum_as_int():
    assert add( "2,3" ) == 5


def test_n_numbered_string_summation():
    assert add( "1,2,3,4" ) == 10


def test_newline_delimiter():
    assert add( "1\n2,3") == 6


def test_parse_user_delimiter():
    assert add( "//;\n1;1" ) == 2
