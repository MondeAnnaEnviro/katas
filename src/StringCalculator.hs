module StringCalculator where


import Data.List.Split


add :: String -> Int
add "" = 0
add numbers = sum [ read num :: Int | num <- multiSplit [",", "\n"] numbers ]



multiSplit :: [String] -> String -> [String]
multiSplit delims nums = foldl (\ xs d -> xs >>= splitOn d ) [nums] delims
