

def add( numbers: str ) -> int:
    delimiter = "\n"

    if "//" in numbers:
        idx = numbers.index( "\n" )
        delimiter = numbers[ 2 : idx ]
        numbers = numbers[ idx + 1 : ]

    return sum (
            int( num)
            for num in numbers.replace( delimiter, "," ).split( "," )
            if numbers
    )
