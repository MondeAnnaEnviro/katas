

def add( numbers: str ) -> int:
    if numbers[ :2 ] == "//":
        idx = numbers.index( "\n" )
        delim = numbers[ 2:idx ]
        numbers = numbers[ idx+1: ].replace( delim, "," )
    numbers = numbers.replace( "\n", "," )
    return sum( int( num ) for num in numbers.split( "," ) if numbers )
