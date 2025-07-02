module StringCalculator where


import Data.List.Split


add :: String -> Int
add "" = 0
add numbers = sum [read num :: Int | num <- splitOn "," numbers ]
