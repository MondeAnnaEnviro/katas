module StringCalculator where


import Data.List.Split



add :: String -> Int
add "" = 0
add number = read number :: Int
