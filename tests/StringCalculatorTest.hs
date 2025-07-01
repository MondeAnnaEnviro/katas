
import StringCalculator
import Test.Hspec


main :: IO ()
main = hspec $ do
  describe "should pass" $ do
    it "passes" $ do
      0 `shouldBe` 0
