
import StringCalculator

import Control.Exception
import Test.Hspec

main :: IO ()
main = hspec $ do
  describe "add numbers:" $ do
    it "empty string returns zero" $ do
      add "" `shouldBe` 0

    it "single numbered string returns as int" $ do
      add "10" `shouldBe` 10

    it "two numbered string returns as sum" $ do
      add "1,0" `shouldBe` 1

    it "n numbered string returns as sum" $ do
      add "1,0,2,1,3" `shouldBe` 7
