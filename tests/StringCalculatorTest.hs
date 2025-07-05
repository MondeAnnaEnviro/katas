
import StringCalculator

import Control.Exception
import Test.Hspec

main :: IO ()
main = hspec $ do
  describe "sum delimiter seperated string of numbers:" $ do
    context "operations around delimiters:" $ do
      it "empty string returns zero" $ do
        add "" `shouldBe` 0

      it "single number returned as int" $ do
        add "1" `shouldBe` 1

      it "two numbers are summed into int" $ do
        add "1,2" `shouldBe` 3

      it "n numbers are summed into int" $ do
        add "1,2,3" `shouldBe` 6

      it "newline as delimiter" $ do
        add "1,2\n3" `shouldBe` 6

      it "ignore numbers greater than 1000" $ do
        add "1,1001" `shouldBe` 1

    context "parse user provided delimiters:" $ do
      it "single delimiter" $ do
        add "//;\n1;2" `shouldBe` 3

      it "single var len delimiter" $ do
        add "//[&&]\n1&&2" `shouldBe` 3

      it "multiple delimiters" $ do
        add "//[!][@]\n0!1@2" `shouldBe` 3

      it "multiple var len delimiters" $ do
        add "//[!][@@][###]\n0!1@@2###3" `shouldBe` 6

    context "exception handling:" $ do
      it "negatives cause error" $ do
        let message = "negatives not allowed: [-1,-2]"
        evaluate ( add "-1,-2" ) `shouldThrow` errorCall message
