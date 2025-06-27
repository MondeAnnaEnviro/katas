{-# LANGUAGE OverloadedStrings #-}
module StringCalculator where


import qualified Data.Text as T


add :: String -> Int
add ( '/':'/':d:'\n':s) = add s
add ( s:_:ss ) = read [s] + add ss
add s
 | null s = 0
 | otherwise = read s :: Int
