{-# LANGUAGE OverloadedStrings #-}
module StringCalculator where


import qualified Data.Text as T


standardDelimiter :: T.Text
standardDelimiter = T.pack ","


add :: String -> Int
add "" = 0
add s = sum $ intList $ unifyDelimiter $ T.pack s


unifyDelimiter :: T.Text -> T.Text
unifyDelimiter s = T.replace ( getDelimiters s ) standardDelimiter ( getNumbers s )


getDelimiters :: T.Text -> T.Text
getDelimiters s
  | T.take 2 s /= T.pack "//" = T.pack "\n"
  | otherwise = T.take 1 $ T.reverse $ T.take 3 s


getNumbers :: T.Text -> T.Text
getNumbers s
  | T.take 2 s /= T.pack "//" = s
  | otherwise = T.reverse $ T.take 3 $ T.reverse s


intList :: T.Text -> [Int]
intList s = [ read $ T.unpack num | num <- T.splitOn standardDelimiter s ]


