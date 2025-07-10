
import StringCalculator

import Control.Exception
import Test.Hspec

main :: IO ()
main = hspec $ do
  describe "summation of delimited string of numbers:" $ do
    context "comma delimitered operations" $ do
      it "empty strings return zero" $ do
        add "" `shouldBe` 0

      it "one numbered returns as int" $ do
        add "1" `shouldBe` 1

      it "two numbers are returned as a summed int" $ do
        add "1,2" `shouldBe` 3

      it "multiple numbers are returned as a summed int" $ do
        add "0,1,2,3" `shouldBe` 6

      it "numbers greater than 1000 ignored" $ do
        add "1,1001" `shouldBe` 1

    context "allow for newline as delimiter:" $ do
      it "have comma and newline cohabitate" $ do
        add "1,2\n3" `shouldBe` 6

    context "parse user provided delimiter:" $ do
      it "single delimiter" $ do
        add "//;\n1;2" `shouldBe` 3

      it "single var len delimiter" $ do
        add "//[;;]\n1;;2" `shouldBe` 3

      it "multiple delimiters" $ do
        add "//[!][@]\n1!2@3" `shouldBe` 6

      it "multiple var len delimiters" $ do
        add "//[!][@@][###]\n1!2@@3###4" `shouldBe` 10

    context "exception handling:" $ do
      it "negatives cause error" $ do
        let message = "negatives not allowed: [-9,-8]"
        evaluate ( add "-9,-8" ) `shouldThrow` errorCall message
