def add( numbers: str ) -> int:
    if "//" == numbers[ :2 ]:
        idx = numbers.index( "\n" )
        delimiter = numbers[ 2:idx ]
        numbers = numbers[ idx+1: ].replace( delimiter, "," )

    numbers = numbers.replace( "\n", "," )

    return sum(
        int( num )
        for num in numbers.replace( "\n", "," ).split( "," )
        if numbers
    )
