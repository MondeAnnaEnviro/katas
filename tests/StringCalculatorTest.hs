
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

    it "n numbers returned as sum" $ do
      add "5,55,5" `shouldBe` 65

    it "use newline as delimiter" $ do
      add "1,2\n3" `shouldBe` 6

    it "numbers greater than one thousand ignored" $ do
      add "1,1001" `shouldBe` 1

  describe "handle exceptions" $ do
    it "negatives throw" $ do
      evaluate ( add "-1,-2" ) `shouldThrow` errorCall "negatives not allowed: [-1,-2]"

  describe "parse user delimiters:" $ do
    it "single user delimiter" $ do
      add "//;\n45;45" `shouldBe` 90
