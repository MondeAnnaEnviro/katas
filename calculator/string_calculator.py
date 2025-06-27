

def add( numbers: str ) -> int:
    delimiter = "\n"

    if "//" in numbers:
        idx = numbers.index( "\n" )
        delimiter = numbers[ 2 : idx ]
        numbers = numbers[ idx + 1 : ]

    nums = [
        int( num)
        for num in numbers.replace( delimiter, "," ).split( "," )
        if numbers
    ]

    negs = [ str( n ) for n in nums if n < 0 ]

    if negs:
        negsStr = ", ".join( negs )
        raise ValueError( f"negatives not allowed: { negsStr }" )
    return sum( nums )
