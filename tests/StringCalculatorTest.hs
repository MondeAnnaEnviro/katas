
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

    it "ignore numbers greater than 1000" $ do
      add "1,1001" `shouldBe` 1

  describe "parse user defined delimiter:" $ do
    it "single delimiter" $ do
      add "//$\n54$45" `shouldBe` 99

    it "var len delimiter" $ do
      add "//[$$$]\n4$$$4" `shouldBe` 8

    it "multiple delimiters" $ do
      add "//[$][!]\n4$4!4" `shouldBe` 12

  describe "exception handling:" $ do
    it "negatives throw error" $ do
      let message = "negatives not allowed: [-2,-2]"
      evaluate ( add "-2,2,-2" ) `shouldThrow` errorCall message
