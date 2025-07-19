
import StringCalculator

import Control.Exception
import Test.Hspec

main :: IO ()
main = hspec $ do
  describe "summation of delimited string of numbers:" $ do
    context "operations about delimiters:" $ do
      it "empty string" $ do
        add "" `shouldBe` 0

      it "one number; no delimiter" $ do
        add "1" `shouldBe` 1

      it "two numbers; comma delimited" $ do
        add "1,2" `shouldBe` 3

      it "n numbers; comma delimited" $ do
        add "1,2,3" `shouldBe` 6

      it "n numbers; comma and newline delimited" $ do
        add "0,1\n2" `shouldBe` 3

      it "numbers greater than 1000 ignored; delimiter independent" $ do
        add "1,1001" `shouldBe` 1

    context "parse user provided delimiters:" $ do
      it "single delimiter" $ do
        add "//;\n1;2" `shouldBe` 3

      it "single var len delimiter" $ do
        add "//[;;]\n1;;2" `shouldBe` 3

      it "mulitple delimiters" $ do
        add "//[!][@]\n1!2@3" `shouldBe` 6

      it "mulitple var len delimiters" $ do
        add "//[!][@@][###]\n1!2@@3###4" `shouldBe` 10

    context "exception handling:" $ do
      it "negatives throw error" $ do
        let message = "negatives not allowed: [-1,-2]"
        evaluate ( add "-1,-2" ) `shouldThrow` errorCall message
