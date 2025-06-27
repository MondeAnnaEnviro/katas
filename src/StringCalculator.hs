{-# LANGUAGE OverloadedStrings #-}
module StringCalculator where


import qualified Data.Text as T


add :: String -> Int
add "" = 0
add s = sum [ read ( T.unpack num ) | num <- T.splitOn ( T.pack "," )( T.pack s )]
