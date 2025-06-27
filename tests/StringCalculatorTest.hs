
import StringCalculator
import Test.Hspec


main :: IO ()
main = hspec $ do
  describe "sum delimited string of numbers:" $ do
    it "empty strings sums to zero" $ do
      add "" `shouldBe` 0

    it "single number returned as int" $ do
      add "123" `shouldBe` 123

    it "two comma delimited numbers are summed" $ do
      add "10,1" `shouldBe` 11

    it "multiple comma delimimted numbers are summed" $ do
      add "1,10,100" `shouldBe` 111

    {-
    it "negatives throw" $ do
      add "-1" `shouldThrow` "negatives not allowed: -1"
    -}

  describe "\nparse non-standard delimiters:" $ do
    it "use comma and newline as delimiters" $ do
      add "1,2\n3" `shouldBe` 6

    it "single char delimiter" $ do
      add "//;\n4;3" `shouldBe` 7
