

def add( numbers: str ) -> int:
    numbers = standardise_delimiter( numbers )
    return sum( int( num ) for num in numbers.split( "," ) if numbers )


def standardise_delimiter( numbers: str ) -> str:
    if numbers[ :2 ] == "//":
        idx = numbers.index( "\n" )
        delims = numbers[ 2:idx ]
        numbers = numbers[ idx+1: ].replace( delims, "," )
    numbers = numbers.replace( "\n", "," )
    return numbers

