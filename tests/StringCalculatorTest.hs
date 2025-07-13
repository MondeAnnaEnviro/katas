
import StringCalculator

import Control.Exception
import Test.Hspec

main :: IO ()
main = hspec $ do
  describe "summation of delimitered string of numbers:" $ do
    context "operations around delimiters:" $ do
      it "empty string returns zero" $ do
        add "" `shouldBe` 0

      it "single number returned as int" $ do
        add "1" `shouldBe` 1

      it "two numbers returned as summed int" $ do
        add "1,2" `shouldBe` 3

      it "n numbers returned as summed int" $ do
        add "0,1,2,3" `shouldBe` 6

      it "allow use of newline as delimiter" $ do
        add "1,2\n3" `shouldBe` 6

    context "parse user provided delimiters:" $ do
      it "single delimiter" $ do
        add "//;\n1;2" `shouldBe` 3

      it "single variable length delimiter" $ do
        add "//[;;]\n1;;2" `shouldBe` 3

      it "multiple single length delimiters" $ do
        add "//[!][@]\n1!2@3" `shouldBe` 6

      it "multiple variable length delimiters" $ do
        add "//[!][@@][###]\n1!2@@3###4" `shouldBe` 10

    context "handle exceptions:" $ do
      it "negative numbers cause error" $ do
        let message = "negatives not allowed: [-1,-2]"
        evaluate ( add "-1,-2" ) `shouldThrow` errorCall message
