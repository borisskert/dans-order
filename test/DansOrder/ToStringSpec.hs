module DansOrder.ToStringSpec where

import DansOrder.ToString
import DansOrder.Tone
import Test.Hspec

spec :: Spec
spec = do
  it "toString" $ do
    toString [C, Csharp, D, Dsharp, E, F, Fsharp, G, Gsharp, A, B, H]
      `shouldBe` "CC#DD#EFF#GG#ABH"

main = hspec spec
