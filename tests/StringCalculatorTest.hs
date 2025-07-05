
import StringCalculator

import Control.Exception
import Test.Hspec

main :: IO ()
main = hspec $ do
  describe "summation of delimiter string of numbers:" $ do
    context "operations on numbers and delimitations" $ do
      it "operating on empty string results in zero" $ do
        add "" `shouldBe` 0

      it "operating on single number results in its int" $ do
        add "45" `shouldBe` 45

      it "operating on two numbers result their int sum" $ do
        add "4,5" `shouldBe` 9

      it "operating on n numbers result their int sum" $ do
        add "4,5,6" `shouldBe` 15

      it "swapping newline as delimiter has no effect" $ do
        add "1,2\n3" `shouldBe` 6

      it "numbers greater than 1000 ignored" $ do
        add "1,1001" `shouldBe` 1

    context "parse user provided delimiters" $ do
      it "single delimiter" $ do
        add "//;\n1;2" `shouldBe` 3

      it "single var len delimiter" $ do
        add "//[;;]\n1;;2" `shouldBe` 3

      it "multiple delimiters" $ do
        add "//[!][@]\n1@2!3" `shouldBe` 6

      it "multiple var len delimiters" $ do
        add "//[!][@@]\n1@@2!3" `shouldBe` 6

    context "exception handling" $ do
      it "negative numbers cause errors" $ do
        let message = "negatives not allowed: [-7,-6]"
        evaluate ( add "-7,-6" ) `shouldThrow` errorCall message
