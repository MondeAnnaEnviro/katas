module StringCalculator where


add :: String -> Int
add "" = 0
add x = read x :: Int
