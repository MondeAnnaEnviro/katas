
import StringCalculator

import Control.Exception
import Test.Hspec

main :: IO ()
main = hspec $ do
  describe "sum delimiters numbers:" $ do
    it "empty string results in zero" $ do
      add "" `shouldBe` 0

    it "one number returned as int" $ do
      add "3" `shouldBe` 3

    it "two numbers are summed" $ do
      add "43,34" `shouldBe` 77

    it "n numbers are summed" $ do
      add "4,3,3,4" `shouldBe` 14

    it "newline as delimiter" $ do
      add "1,2\n3" `shouldBe` 6
