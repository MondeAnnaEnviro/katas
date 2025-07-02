
import StringCalculator

import Control.Exception
import Test.Hspec

main :: IO ()
main = hspec $ do
  describe "sum delimited numbers:" $ do
    it "empty string sums to zero" $ do
      add "" `shouldBe` 0

    it "one number returned as int" $ do
      add "6" `shouldBe` 6

    it "two numbers are summed" $ do
      add "54,3" `shouldBe` 57

    it "n numbers are summed" $ do
      add "6,5,4,3" `shouldBe` 18

    it "newline as delimiter" $ do
      add "1,2\n3" `shouldBe` 6

  describe "parse user provided delimiters:" $ do
    it "single delimiter" $ do
      add "//(\n9(8" `shouldBe` 17
