
import StringCalculator
import Test.Hspec


main :: IO ()
main = hspec $ do
  describe "ensure linkage to src" $ do
    it "is linked" $ do
      isLinked `shouldBe` True
