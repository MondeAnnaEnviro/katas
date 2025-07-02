
import StringCalculator

import Control.Exception
import Test.Hspec

main :: IO ()
main = hspec $ do
  describe "add numbers:" $ do
    it "empty string returns zero" $ do
      add "" `shouldBe` 0

