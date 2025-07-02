

def add( numbers: str ) -> int:
    return sum( int( num ) for num in numbers.split( "," ) if numbers )
