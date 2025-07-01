module StringCalculator where


import Data.List.Split


add :: String -> Int
add "" = 0
--add numbers = sum . multiSplit . intList . numsList $ numbers
-- add numbers = sum . multiSplit . intList .
add numbers = sum . intList . numsList $ numbers


getBody :: String -> String
getBody numbers
  | not . hasFlag $ numbers = numbers
  | otherwise = last . splitOn "\n" $ numbers


getDelimiter :: String -> [String]
getDelimiter numbers
  | not . hasFlag $ numbers = [",", "\n"]
  | otherwise = [ head . splitOn "\n" $ numbers ]


hasFlag :: String -> Bool
hasFlag numbers = take 2 numbers == "//"


intList :: [String] -> [Int]
intList numbers = [ read num :: Int | num <- numbers ]


multiSplit :: (Eq a) => [[a]] -> [a] -> [[a]]
multiSplit delims nums = foldl (\xs d -> xs >>= splitOn d ) [nums] delims


numsList :: String -> [String]
numsList numbers = multiSplit ( getDelimiter numbers )( getBody numbers )


standardiseDelimiter :: String -> String
standardiseDelimiter numbers
  | not . hasFlag $ numbers = numbers
  | otherwise = ","
