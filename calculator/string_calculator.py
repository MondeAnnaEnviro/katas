from typing import List


def add( numbers: str ) -> int:
    numbers = standardise_numbers( numbers )
    nums = [
        thousand_or_less( num ) for num in numbers.split(",") if numbers
    ]
    eval_negatives( nums=nums )
    return sum( nums )


def thousand_or_less( num: str ) -> int:
    return int(num) if int( num ) <= 1000 else 0


def eval_negatives( nums: List[int] ) -> None:
    negs = [ str(num) for num in nums if num < 0 ]
    if negs:
        negsStr = ", ".join( negs )
        raise ValueError( f"negatives not allowed: {negsStr}" )


def standardise_numbers( numbers: str ) -> str:
    if not numbers.startswith("//"):
        return numbers.replace("\n", ",") 
    
    idx = numbers.index("\n")
    delims = numbers[2:idx].replace("][", ",").replace("[", "").replace("]", "")
    numbers = numbers[idx+1:]

    for delim in delims.split(","):
        numbers = numbers.replace(delim, ",")
    return numbers
