module StringCalculator where


import Data.List.Split


add :: String -> Int
add "" = 0
add numbers = sum . parseNegs $ [ read num :: Int | num <- multiSplit ( getDelims numbers )( getBody numbers )]


getBody :: String -> String
getBody numbers
  | not . hasFlag $ numbers = numbers
  | otherwise = last . splitOn "\n" $ numbers


getDelims :: String -> [String]
getDelims numbers
  | not . hasFlag $ numbers = [",", "\n"]
  | otherwise = [ drop 2 $ head . splitOn "\n" $ numbers ]


getNegs :: [Int] -> [Int]
getNegs integers = filter ( < 0 ) integers


hasFlag :: String -> Bool
hasFlag numbers = take 2 numbers == "//"


hasNegs :: [Int] -> Bool
hasNegs integers = any ( < 0 ) integers


multiSplit :: [String] -> String -> [String]
multiSplit delims nums = foldl (\ xs d -> xs >>= splitOn d ) [nums] delims


parseNegs :: [Int] -> [Int]
parseNegs integers
  | hasNegs integers = error $ "negatives not allowed: " ++ show ( getNegs integers )
  | otherwise = integers
