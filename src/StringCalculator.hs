module StringCalculator where


import Data.List.Split


add :: String -> Int
add "" = 0
add numbers = sum . oneThousandOrLess . parseNegs . intList . numList $ numbers


dropBrackets :: String -> String
dropBrackets delims
  | not . hasBrackets $ delims = delims
  | otherwise = init . tail $ delims


getBody :: String -> String
getBody numbers
  | not . hasFlag $ numbers = numbers
  | otherwise = last . splitOn "\n" $ numbers


getDelims :: String -> [String]
getDelims numbers
  | not . hasFlag $ numbers = [",", "\n"]
  | otherwise = [ dropBrackets . drop 2 $ head . splitOn "\n" $ numbers ]


getNegs :: [Int] -> [Int]
getNegs integers = filter ( < 0 ) integers


hasBrackets :: String -> Bool
hasBrackets delims = head delims == '[' && last delims == ']'


hasFlag :: String -> Bool
hasFlag numbers = take 2 numbers == "//"


hasNegs :: [Int] -> Bool
hasNegs integers = any ( < 0 ) integers


intList :: [String] -> [Int]
intList numbers = [ read num :: Int | num <- numbers ]


multiSplit :: [String] -> String -> [String]
multiSplit delims nums = foldl (\ xs d -> xs >>= splitOn d ) [nums] delims


numList :: String -> [String]
numList numbers = multiSplit ( getDelims numbers )( getBody numbers )


oneThousandOrLess :: [Int] -> [Int]
oneThousandOrLess integers = filter ( <= 1000 ) integers


parseNegs :: [Int] -> [Int]
parseNegs integers
  | not . hasNegs $ integers = integers
  | otherwise = error $ "negatives not allowed: " ++ show ( getNegs integers )
