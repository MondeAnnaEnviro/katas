
import StringCalculator
import Test.Hspec


main :: IO ()
main = hspec $ do
  describe "sum delimiterd numbers:" $ do
    it "empty string renders zero" $ do
      add "" `shouldBe` 0

    it "single number remains as is" $ do
      add "55" `shouldBe` 55

    it "two numbers are summed" $ do
      add "64,5" `shouldBe` 69

    it "n numbers are summed" $ do
      add "1,2,3,4" `shouldBe` 10

    it "use newline as delimiter" $ do
      add "1,1\n1" `shouldBe` 3
