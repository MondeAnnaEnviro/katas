

def add( numbers: str ) -> int:
    delimiter = "\n"

    delimiter, numbers = parseDelimiter( numbers )

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

def parseDelimiter( numbers: str ) -> tuple:
    if "//" not in numbers:
        return "\n", numbers

    idx = numbers.index( "\n" )
    delimiter = numbers[ 2 : idx ].replace( "[", "" ).replace( "]", "" )
    return delimiter, numbers[ idx + 1 : ]

