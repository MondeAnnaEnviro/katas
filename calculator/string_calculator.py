import re


def add( numbers: str ) -> int:
    delimiters = ",|\n"
    if "//" == numbers[:2]:
        idx = numbers.find( "\n" )
        delimiters = numbers[ 2:idx ]
        numbers = numbers[ idx+1: ]

    nums = [
        int( num )
        for num in re.split( delimiters, numbers )
        if numbers
    ]

    negs = [ str( num ) for num in nums if num < 0 ]

    if negs:
        negsStr = ", ".join( negs )
        raise ValueError( f"negatives not allowed: {negsStr}" )

    return sum( nums )
