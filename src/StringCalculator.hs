{-# LANGUAGE OverloadedStrings #-}
module StringCalculator where


import qualified Data.Text as T


add :: String -> Int
add "" = 0
