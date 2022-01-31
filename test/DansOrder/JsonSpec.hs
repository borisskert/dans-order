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

  it "should decode, sort and encode" $ do
    (map toJson . dansOrders . fromJson $ "[\"DADF#AD\", \"EADGHE\", \"CGDGAD\", \"D#A#CGA#D\", \"DGDGAD\", \"F#ADGHE\", \"HGDGAD\", \"DAC#EHE\", \"CGCGAD\"]")
      `shouldBe` ["[\"F#ADGHE\",\"EADGHE\",\"DAC#EHE\",\"DADF#AD\",\"DGDGAD\",\"CGDGAD\",\"HGDGAD\",\"CGCGAD\",\"D#BCGBD\"]"]

main = hspec spec
