

def add( numbers: str ) -> int:

    if numbers[ :2 ] == "//":
        idx = numbers.index( "\n" )
        delims = numbers[ 2:idx ]
        numbers = numbers[ idx+1: ].replace( delims, "," )
    numbers = numbers.replace( "\n", "," )
    return sum( int( num ) for num in numbers.split( "," ) if numbers )

