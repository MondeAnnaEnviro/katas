

def add( numbers: str ) -> int:
    return sum (
            int( num)
            for num in numbers.replace( "\n", "," ).split( "," )
            if numbers
    )
