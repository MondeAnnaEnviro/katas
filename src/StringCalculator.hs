{-# LANGUAGE OverloadedStrings #-}
module StringCalculator where


import qualified Data.Text as T


add :: String -> Int
add "" = 0
add s = sum $ toList $ unifyDelimiter $ T.pack s


unifyDelimiter :: T.Text -> T.Text
unifyDelimiter s = T.replace ( T.pack "\n" )( T.pack "," ) s


toList :: T.Text -> [Int]
toList s = [ read $ T.unpack num | num <- T.splitOn comma s ]
  where
    comma = T.pack ","
