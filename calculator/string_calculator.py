import re


def add( numbers: str ) -> int:
    delimiters, numbers = parse_delimiters( numbers )

    nums = [
        int( num ) if int( num ) <= 1000 else 0
        for num in re.split( delimiters, numbers )
        if numbers
    ]

    negs = [ str( num ) for num in nums if num < 0 ]

    if negs:
        negsStr = ", ".join( negs )
        raise ValueError( f"negatives not allowed: {negsStr}" )

    return sum( nums )


def parse_delimiters( numbers: str ) -> tuple:
    delimiters = ",|\n"
    numbers = numbers.replace( "*", "," ).replace( "|", "," )

    if "//" != numbers[ :2 ]:
        return delimiters, numbers

    idx = numbers.find( "\n" )
    delimiters = numbers[ 2:idx ].replace( "[", "" ).replace( "]", "" )
    numbers = numbers[ idx+1: ]

    return delimiters, numbers
