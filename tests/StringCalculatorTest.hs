
import StringCalculator

import Control.Exception
import Test.Hspec

main :: IO ()
main = hspec $ do
  describe "sum delimited numbers:" $ do
    it "empty string sums to zero" $ do
      add "" `shouldBe` 0
