
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

    it "use newline as delimiter" $ do
      add "1,2\n3" `shouldBe` 6

    it "numbers greater than one thousand ignored" $ do
      add "1,1001" `shouldBe` 1

  describe "parse user provided delimiter:" $ do
    it "single delimiter" $ do
      add "//;\n4;4" `shouldBe` 8

    it "var len delimiter" $ do
      add "//[###]\n5###7" `shouldBe` 12

    it "multiple single len delimiters" $ do
      add "//[#][%]\n55#45%100" `shouldBe` 200

    it "multiple var len delimiters" $ do
      add "//[!!][^^^][*]\n5!!5*4^^^5" `shouldBe` 19

  describe "exception handling:" $ do
    it "negatives throw" $ do
      let message = "negatives not allowed: [-3,-5]"
      evaluate ( add "-3,4,-5" ) `shouldThrow` errorCall message
