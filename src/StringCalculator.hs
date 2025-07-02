module StringCalculator where


import Data.List.Split


add :: String -> Int
add "" = 0
add numbers = sum . intList $ numbers

intList :: String -> [Int]
intList numbers = [ read num :: Int | num <- multiSplit (getDelims numbers )( getBody numbers )]


getBody :: String -> String
getBody numbers
  | not . hasFlag $ numbers = numbers
  | otherwise = last . splitOn "\n" $ numbers


getDelims :: String -> [String]
getDelims numbers
  | not . hasFlag $ numbers = [",", "\n"]
  | otherwise = [[ last . take 3 $ numbers ]]


hasFlag :: String -> Bool
hasFlag numbers = take 2 numbers == "//"


multiSplit :: [String] -> String -> [String]
multiSplit delims nums = foldl (\ xs d -> xs >>= splitOn d ) [nums] delims
