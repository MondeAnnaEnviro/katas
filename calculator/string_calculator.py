from typing import List


def add( numbers: str ) -> int:
    numbers = standardise_delims( numbers )
    nums = toInts( numbers )
    negs = [ str( num ) for num in nums if num < 0 ]

    if negs:
        negsStr = ", ".join( negs )
        raise ValueError( f"negatives not allowed: {negsStr}" )

    return sum( nums )


def standardise_delims( numbers: str ) -> str:
    if numbers[ :2 ] != "//":
        return numbers.replace( "\n", "," )

    idx = numbers.index( "\n" )
    delims = numbers[ 2:idx ]
    delims = delims.replace( "][", "," ).replace( "[", "" ).replace( "]", "" )
    numbers = numbers[ idx+1: ]

    for delim in delims.split( "," ):
        numbers = numbers.replace( delim, "," )

    return numbers


def thousandOrLess( number: str ) -> int:
    return int( number ) if int( number ) <= 1000 else 0


def toInts( numbers: str ) -> List[int]:
    return [
        thousandOrLess( num )
        for num in numbers.split( "," )
        if numbers
    ]

