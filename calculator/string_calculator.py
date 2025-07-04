

def add( numbers: str ) -> int:
    if numbers[ :2 ] == "//":
        idx = numbers.index( "\n" )
        delim = numbers[ 2:idx ]
        numbers = numbers[ idx+1: ].replace( delim, "," )
    numbers = numbers.replace( "\n", "," )

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
