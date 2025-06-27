{-# LANGUAGE OverloadedStrings #-}
module StringCalculator where


import qualified Data.Text as T


newtype NegativesError a = Error a deriving Show


add :: String -> Int
add "" = 0
add s = read s
