
import StringCalculator
import Test.Hspec


main :: IO ()
main = hspec $ do
  describe "sum delimiterd numbers:" $ do
    it "empty string renders zero" $ do
      add "" `shouldBe` 0

    it "single number remains as is" $ do
      add "55" `shouldBe` 55
