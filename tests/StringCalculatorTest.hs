
import StringCalculator

import Control.Exception
import Test.Hspec

main :: IO ()
main = hspec $ do
  describe "sum delimiters numbers:" $ do
    it "empty string is zero" $ do
      add "" `shouldBe` 0

    it "one numbers returned as int" $ do
      add "45" `shouldBe` 45

    it "two numbers are summed" $ do
      add "6,3" `shouldBe` 9

    it "n numbers are summed" $ do
      add "6,3,7,5" `shouldBe` 21

    it "newline as delimiter" $ do
      add "5,5\n5" `shouldBe` 15

    it "nums greater than 1000 ignored" $ do
      add "1,1001" `shouldBe` 1

  describe "parse user delimiters:" $ do
    it "process single delimiter" $ do
      add "//;\n3;3" `shouldBe` 6

    it "process var len delimiter" $ do
      add "//[;;]\n33;;3" `shouldBe` 36

    it "process multiple delimiters" $ do
      add "//[;][*]\n3*3;3" `shouldBe` 9

    it "process multiple var len delimiters" $ do
      add "//[;][**][+++]\n1;2**3+++4" `shouldBe` 10

  describe "exception handling:" $ do
    it "negative numbers cause error" $ do
      let message = "negatives not allowed: [-1,-30]"
      evaluate ( add "-1,-30" ) `shouldThrow` errorCall message
