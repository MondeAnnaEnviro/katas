
import StringCalculator

import Control.Exception
import Test.Hspec

main :: IO ()
main = hspec $ do
  describe "sum delimited string of numbers:" $ do
    it "empty string results in zero" $ do
      add "" `shouldBe` 0

    it "single number converted to int" $ do
      add "53" `shouldBe` 53

    it "two numbers summed" $ do
      add "3,54" `shouldBe` 57

    it "n numbers summed" $ do
      add "10,3,5,4" `shouldBe` 22

    it "use newline as delimiter" $ do
      add "1,2\n3" `shouldBe` 6
