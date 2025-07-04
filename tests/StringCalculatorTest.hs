
import StringCalculator

import Control.Exception
import Test.Hspec

main :: IO ()
main = hspec $ do
  describe "sum delimited numbers:" $ do
    it "empty string results in zero" $ do
      add "" `shouldBe` 0

    it "single number returned as int" $ do
      add "55" `shouldBe` 55

    it "two numbers are summed" $ do
      add "5,5" `shouldBe` 10

    it "n numbers are summed" $ do
      add "5,5,5,6,6,6" `shouldBe` 33
