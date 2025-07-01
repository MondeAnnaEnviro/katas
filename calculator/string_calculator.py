

def add( numbers: str ) -> int:
    numbers = standardise_delimiter( numbers )
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


def standardise_delimiter( numbers: str ) -> str:
    if numbers[ :2 ] != "//":
        return numbers.replace( "\n", "," )

    idx = numbers.index( "\n" )
    delims = numbers[ 2:idx ].replace( "[", "" ).replace( "]", "" )
    numbers = numbers[ idx+1: ].replace( delims, "," )

    return numbers

