
import StringCalculator

import Control.Exception
import Test.Hspec


main :: IO ()
main = hspec $ do
  describe "sum delimited numbers:" $ do
    it "empty string returns zero" $ do
      add "" `shouldBe` 0

    it "single number returned as int" $ do
      add "555" `shouldBe` 555

    it "two numbers returned as sum" $ do
      add "5,5" `shouldBe` 10
