import re


def add( numbers: str ) -> int:
    delimiter = "\n"

    delimiters, numbers = parseDelimiter( numbers )

    nums = [
        int( num)
        for num in re.split( delimiters, numbers )
        if numbers
    ]

    negs = [ str( n ) for n in nums if n < 0 ]

    if negs:
        negsStr = ", ".join( negs )
        raise ValueError( f"negatives not allowed: { negsStr }" )

    return sum( nums )

def parseDelimiter( numbers: str ) -> tuple:
    if "//" not in numbers:
        return "\n|,", numbers

    idx = numbers.index( "\n" )
    delimiters = numbers[ 2 : idx ].replace( "][", "|" ).replace( "[", "" ).replace( "]", "" )
    numbers = numbers[ idx + 1 : ]

    return delimiters, numbers

