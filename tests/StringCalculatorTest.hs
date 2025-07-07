
import StringCalculator

import Control.Exception
import Test.Hspec

main :: IO ()
main = hspec $ do
  describe "sum delimited string of numbers:" $ do
    context "operations around delimiters" $ do
      it "empty string returns as zero" $ do
        add "" `shouldBe` 0

      it "one number returns as is" $ do
        add "1" `shouldBe` 1

      it "two numbers returns as summation" $ do
        add "0,1" `shouldBe` 1

      it "n numbers returns as summation" $ do
        add "0,1,2,3" `shouldBe` 6

      it "use newline as delimiter" $ do
        add "1,2\n3" `shouldBe` 6

      it "numbers greater than 1000 ignored" $ do
        add "1,1001" `shouldBe` 1

    context "parse user provided delimiters:" $ do
      it "single delimiter" $ do
        add "//;\n1;2" `shouldBe` 3

      it "single var len delimiter" $ do
        add "//[;;]\n1;;2" `shouldBe` 3

      it "multiple delimiters" $ do
        add "//[;][#]\n1;2#3" `shouldBe` 6

      it "multiple var len delimiters" $ do
        add "//[;][##][$$$]\n1;2##3$$$4" `shouldBe` 10

    context "exception handling:" $ do
      it "negatives throw error" $ do
        let message = "negatives not allowed: [-1,-2]"
        evaluate ( add "-1,-2" ) `shouldThrow` errorCall message
