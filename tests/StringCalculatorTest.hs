
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
