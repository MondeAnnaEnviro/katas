
import StringCalculator

import Control.Exception
import Test.Hspec

main :: IO ()
main = hspec $ do
  describe "sum delimited string of numbers:" $ do
    it "empty string results in zero" $ do
      add "" `shouldBe` 0
