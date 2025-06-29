import re


def add( numbers: str ) -> int:
    delimiters = ",|\n"
    if "//" == numbers[:2]:
        idx = numbers.find( "\n" )
        delimiters = numbers[ 2:idx ]
        numbers = numbers[ idx+1: ]

    return sum(
            int( num )
            for num in re.split( delimiters, numbers )
            if numbers
    )
