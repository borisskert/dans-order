module DansOrder.JsonSpec where

import DansOrder
import DansOrder.Json
import Test.Hspec

spec :: Spec
spec = do
  it "fromJson" $ do
    fromJson "[]" `shouldBe` []
    fromJson "[\"EADGHE\", \"DADGAD\", \"DADF#AD\"]"
      `shouldBe` [[E, A, D, G, H, E], [D, A, D, G, A, D], [D, A, D, Fsharp, A, D]]

  it "toJson" $ do
    toJson [] `shouldBe` "[]"
    toJson [[E, A, D, G, H, E], [D, A, D, G, A, D], [D, A, D, Fsharp, A, D]]
      `shouldBe` "[\"EADGHE\",\"DADGAD\",\"DADF#AD\"]"

main = hspec spec
