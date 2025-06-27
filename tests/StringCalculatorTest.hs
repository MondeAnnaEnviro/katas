
import StringCalculator
import Test.Hspec


main :: IO ()
main = hspec $ do
  describe "sum delimters string of numbers" $ do
    it "add '' -> 0" $ do
      add "" `shouldBe` 0
