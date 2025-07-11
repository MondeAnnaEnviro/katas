module StringCalculator where


import Data.List.Split


add :: String -> Int
add "" = 0
add numbers = summation . processNegs . intList . strNumsList$ numbers


dropBrackets :: String -> String
dropBrackets delims
  | not . hasBrackets $ delims = delims
  | otherwise = init . tail $ delims


dropFlag :: String -> String
dropFlag delims
  | not . hasFlag $ delims = delims
  | otherwise = drop 2 delims


getBody :: String -> String
getBody numbers
  | not . hasFlag $ numbers = numbers
  | otherwise = last . splitOn "\n" $ numbers


getDelims :: String -> [String]
getDelims numbers
  | not . hasFlag $ numbers = [",", "\n"]
  | otherwise = splitOn "][" $ dropBrackets . dropFlag . head . splitOn "\n" $ numbers


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
multiSplit delims numbers = foldl (\ xs d -> xs >>= splitOn d ) [numbers] delims


processNegs :: [Int] -> [Int]
processNegs integers
  | not . hasNegs $ integers = integers
  | otherwise = error $ "negatives not allowed: " ++ show ( getNegs integers )


strNumsList :: String -> [String]
strNumsList numbers = multiSplit ( getDelims numbers )( getBody numbers )


summation :: [Int] -> Int
summation integers = sum . filter ( <= 1000 ) $ integers
