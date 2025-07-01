
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

    it "sum string of n comma seperated numbers" $ do
      add "0,1,1,2,3,5,8" `shouldBe` 20

    it "newline as delimiter" $ do
      add "0,1\n2" `shouldBe` 3

{-
  describe "sum string with user delim:" $ do
    it "single delim" $ do
      add "//;\n1;2" `shouldBe` 3
-}
