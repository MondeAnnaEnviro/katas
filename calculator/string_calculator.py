import re


def add( numbers: str ) -> int:
    return sum(
        int( num )
        for num in re.split( ",|\n", numbers )
        if numbers
    )
