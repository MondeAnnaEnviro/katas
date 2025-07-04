

def add( numbers: str ) -> int:
    numbers = standardise_delims( numbers )

    nums = [
        int( num ) if int( num ) <= 1000 else 0
        for num in numbers.split( "," )
        if numbers
    ]

    negs = [ str( num ) for num in nums if num < 0 ]

    if negs:
        negsStr = ", ".join( negs )
        raise ValueError( f"negatives not allowed: {negsStr}" )

    return sum( nums )


def standardise_delims( numbers: str ) -> str:
    if numbers[ :2 ] != "//":
        return numbers.replace( "\n", "," )

    idx = numbers.index( "\n" )
    delim = numbers[ 2:idx ].replace( "[", "" ).replace( "]", "" )

    return numbers[ idx+1: ].replace( delim, "," )


