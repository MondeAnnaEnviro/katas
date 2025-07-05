module StringCalculator where


import Data.List.Split


add :: String -> Int
add "" = 0
add numbers = summation . processNegs . intList . numsList $ numbers


dropBrackets :: String -> String
dropBrackets delims
  | not . hasBrackets $ delims = delims
  | otherwise = init . tail $ delims


dropFlag :: String -> String
dropFlag delim = drop 2 delim


getBody :: String -> String
getBody numbers
  | not . hasFlag $ numbers = numbers
  | otherwise = last . splitOn "\n" $ numbers


getDelims :: String -> [String]
getDelims numbers
  | not . hasFlag $ numbers = [",", "\n"]
  | otherwise = multiSplit ["]["] $ dropBrackets . dropFlag . head . splitOn "\n" $ numbers


getNegs :: [Int] -> [Int]
getNegs integers = filter ( < 0 ) integers


hasBrackets :: String -> Bool
hasBrackets delims = head delims == '[' && last delims == ']'


hasFlag :: String -> Bool
hasFlag delims = take 2 delims == "//"


hasNegs :: [Int] -> Bool
hasNegs integers = any ( < 0 ) integers


intList :: [String] -> [Int]
intList numbers = [ read num :: Int | num <- numbers ]


multiSplit :: [String] -> String -> [String]
multiSplit delims nums = foldl (\ xs d -> xs >>= splitOn d ) [nums] delims


numsList :: String -> [String]
numsList numbers = multiSplit ( getDelims numbers )( getBody numbers )


processNegs :: [Int] -> [Int]
processNegs integers
  | not . hasNegs $ integers = integers
  | otherwise = error $ "negatives not allowed: " ++ show ( getNegs integers )


summation :: [Int] -> Int
summation integers = sum . filter ( <= 1000 ) $ integers
