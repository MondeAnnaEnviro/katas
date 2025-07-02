

def add( numbers: str ) -> int:
    if numbers[ :2 ] == "//":
        idx = numbers.index( "\n" )
        delims = numbers[ 2:idx ].replace( "][", "," ).replace( "[", "" ).replace( "]", "")
        numbers = numbers[ idx+1: ]

        for delim in delims.split( "," ):
            print( delims )
            numbers = numbers.replace( delim, "," )

    nums = [
        int( num ) if int( num ) <= 1000 else 0
        for num in numbers.replace( "\n", "," ).split( "," )
        if numbers
    ]

    negs = [ str( num ) for num in nums if num < 0 ]

    if negs:
        negsStr = ", ".join( negs )
        raise ValueError( f"negatives not allowed: {negsStr}" )

    return sum( nums )
