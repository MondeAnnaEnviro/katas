
import StringCalculator
import Test.Hspec


main :: IO ()
main = hspec $ do
  describe "add delimited numbers" $ do
    it "empty string is zero" $ do
      add "" `shouldBe` 0

    it "single number converted to int" $ do
      add "34" `shouldBe` 34
