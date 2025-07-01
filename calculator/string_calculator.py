

def add( numbers: str ) -> int:
    numbers = standardise_delimiter( numbers )
    nums = [
        int( num )
        for num in numbers.split( "," )
        if numbers
    ]

    negs = [ str( num ) for num in nums if num < 0 ]

    if negs:
        negsStr = ", ".join( negs )
        raise ValueError( f"negatives not allowed: {negsStr}" )

    return sum( nums )


def standardise_delimiter( numbers: str ) -> str:
    if numbers[ :2 ] == "//":
        idx = numbers.index( "\n" )
        delims = numbers[ 2:idx ]
        numbers = numbers[ idx+1: ].replace( delims, "," )
    numbers = numbers.replace( "\n", "," )
    return numbers

