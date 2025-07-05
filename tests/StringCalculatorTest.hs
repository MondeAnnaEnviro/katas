
import StringCalculator

import Control.Exception
import Test.Hspec

main :: IO ()
main = hspec $ do
  describe "sum delimited string of numbers:" $ do
    context "process delimitations:" $ do
      it "empty string returns zero" $ do
        add "" `shouldBe` 0

      it "one number returns as int" $ do
        add "1" `shouldBe` 1

      it "two numbers return int sum" $ do
        add "1,2" `shouldBe` 3

      it "n numbers return int sum" $ do
        add "1,2,3" `shouldBe` 6

      it "newline as delimiter" $ do
        add "1,2\n3" `shouldBe` 6

      it "numbers greater than 1000 ignored" $ do
        add "1,1001" `shouldBe` 1

    context "parse user provided delimiter:" $ do
      it "single user delimiter" $ do
        add "//;\n1;2" `shouldBe` 3

      it "single var len user delimiter" $ do
        add "//[**]\n1**2" `shouldBe` 3

      it "multiple user delimiters" $ do
        add "//[!][@]\n0!1@2" `shouldBe` 3

      it "multiple var len user delimiters" $ do
        add "//[!][@@][###]\n0!1@@2###3" `shouldBe` 6

    context "exception handling:" $ do
      it "negatives cause error call" $ do
        let message = "negatives not allowed: [-1,-2]"
        evaluate ( add "-1,-2" ) `shouldThrow` errorCall message
