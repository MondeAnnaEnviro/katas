
import StringCalculator
import Test.Hspec


main :: IO ()
main = hspec $ do
  describe "sum string:" $ do
    it "empty string renders zero" $ do
      add "" `shouldBe` 0

    it "string of value n renders n" $ do
      add "10" `shouldBe` 10

    it "sum string of two comma seperated numbers" $ do
      add "1,1" `shouldBe` 2
