
import StringCalculator
import Test.Hspec


main :: IO ()
main = hspec $ do
  describe "ensure is connected:" $ do
    it "should pass" $ do
      1 `shouldBe` 1
