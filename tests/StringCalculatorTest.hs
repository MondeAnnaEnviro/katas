
import StringCalculator

import Control.Exception
import Test.Hspec


main :: IO ()
main = hspec $ do
  describe "sum delimitered numbers:" $ do
    it "empty string renders zero" $ do
      add "" `shouldBe` 0

    it "single number remains as is" $ do
      add "55" `shouldBe` 55

    it "two numbers are summed" $ do
      add "64,5" `shouldBe` 69

    it "n numbers are summed" $ do
      add "1,2,3,4" `shouldBe` 10

    it "use newline as delimiter" $ do
      add "1,1\n1" `shouldBe` 3

  describe "parse user provided delimiters:" $ do
    it "single delimiter" $ do
      add "//;\n0;0" `shouldBe` 0

  describe "handling errors:" $ do
    it "negative numbers throw" $ do
      evaluate ( add "-1,-2" ) `shouldThrow` errorCall "negatives not allowed: [-1,-2]"
