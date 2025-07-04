

def add( numbers: str ) -> int:
    numbers = numbers.replace( "\n", "," )
    return sum( int( num ) for num in numbers.split( "," ) if numbers )
