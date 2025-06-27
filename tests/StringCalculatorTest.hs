
import StringCalculator
import Test.Hspec


main :: IO ()
main = hspec $ do
  describe "sum delimters string of numbers" $ do
    it "'' -> 0" $ do
      add "" `shouldBe` 0

    it "'x' -> x" $ do
      add "3" `shouldBe` 3
