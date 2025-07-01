
import StringCalculator
import Test.Hspec


main :: IO ()
main = hspec $ do
  describe "sum string:" $ do
    it "empty string renders zero" $ do
      add "" `shouldBe` 0
