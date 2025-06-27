
import StringCalculator
import Test.Hspec


main :: IO ()
main = hspec $ do
  describe "sum delimters string of numbers" $ do
    it "'' -> 0" $ do
      add "" `shouldBe` 0

    it "'x' -> x" $ do
      add "3" `shouldBe` 3

    it "'x,y' -> x + y" $ do
      add "8,8" `shouldBe` 16

    it "'x0,x1,...xn' -> sum [ x0, x1, ..., xn ]" $ do
      add "7,7,7" `shouldBe` 21

    it "use comma and newline as delimiters" $ do
      add "1,2\n3" `shouldBe` 6
