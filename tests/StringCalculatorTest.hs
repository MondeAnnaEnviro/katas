
import StringCalculator
import Test.Hspec


main :: IO ()
main = hspec $ do
  describe "jibberish" $ do
    it "words" $ do
      0 `shouldBe` 0
