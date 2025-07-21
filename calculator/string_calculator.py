from typing import List


def add( numbers: str ) -> int:
    numbers = standardise_delimiter( numbers )
    nums = get_list_of_numbers( numbers )

    negs = [ str( num ) for num in nums if num < 0 ]

    if negs:
        negsStr = ", ".join( negs )
        raise ValueError( f"negatives not allowed: {negsStr}" )

    return sum( nums )


def get_list_of_numbers( numbers: str ) -> List[int]:
    return [
        thousand_or_less( num )
        for num in numbers.split( "," )
        if numbers
    ]


def standardise_delimiter( numbers: str ) -> str:
    if not numbers.startswith( "//"):
        return  numbers.replace( "\n", "," )

    idx = numbers.index( "\n" )
    delims = numbers[ 2:idx ].replace( "][", "," ).replace( "[", "" ).replace( "]", "")
    numbers = numbers[ idx+1: ]

    for delim in delims.split( "," ):
        numbers = numbers.replace( delim, "," )

    return numbers


def thousand_or_less( number: str ) -> int:
    return int( number ) if int( number ) <= 1000 else 0
