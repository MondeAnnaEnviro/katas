module StringCalculator where


import Data.List.Split


add :: String -> Int
add "" = 0
add numbers = sum [ read num :: Int | num <- numsList $ numbers ]


getBody :: String -> String
getBody numbers
  | not . hasFlag $ numbers = numbers
  | otherwise = last . splitOn "\n" $ numbers


getDelims :: String -> [String]
getDelims numbers
  | not . hasFlag $ numbers = [",", "\n"]
  | otherwise = [ drop 2 $ head . splitOn "\n" $ numbers]


hasFlag :: String -> Bool
hasFlag numbers = take 2 numbers == "//"


multiSplit :: [String] -> String -> [String]
multiSplit delims nums = foldl (\ xs d -> xs >>= splitOn d ) [nums] delims


numsList :: String -> [String]
numsList numbers = multiSplit ( getDelims numbers )( getBody numbers )
