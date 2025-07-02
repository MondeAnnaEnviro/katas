
import StringCalculator

import Control.Exception
import Test.Hspec

main :: IO ()
main = hspec $ do
  describe "sum delimited string of numbers:" $ do
    it "empty string results in zero" $ do
      add "" `shouldBe` 0

    it "single number converted to int" $ do
      add "53" `shouldBe` 53

    it "two numbers summed" $ do
      add "3,54" `shouldBe` 57

    it "n numbers summed" $ do
      add "10,3,5,4" `shouldBe` 22

    it "use newline as delimiter" $ do
      add "1,2\n3" `shouldBe` 6

    it "ignore numbers greater than one thousand" $ do
      add "1,1001" `shouldBe` 1

  describe "parse user provided delimiters:" $ do
    it "single delimiter" $ do
      add "//$\n54$6" `shouldBe` 60

    it "var length single delimiter" $ do
      add "//[***]\n323***323" `shouldBe` 646

    it "multiple user delimiters" $ do
      add "//[$][@]\n44@55$1" `shouldBe` 100

    it "multiple var len user delimiters" $ do
      add "//[$$][@]\n4@5$$1" `shouldBe` 10

  describe "handle exceptions:" $ do
    it "negatives throw" $ do
      let message = "negatives not allowed: [-3,-5]"
      evaluate ( add "-3,2,-5" ) `shouldThrow` errorCall message
