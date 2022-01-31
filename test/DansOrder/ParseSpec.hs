module DansOrder.ParseSpec where

import DansOrder.Parse
import DansOrder.Tone
import Test.Hspec

spec :: Spec
spec = do
  it "parseInput" $ do
    parseInput [] `shouldBe` []
    parseInput ["EADGHE", "DADF#AD", "DADGAD"]
      `shouldBe` [[E, A, D, G, H, E], [D, A, D, Fsharp, A, D], [D, A, D, G, A, D]]
    parseInput ["DADGA#D"]
      `shouldBe` [[D, A, D, G, B, D]]

main = hspec spec
