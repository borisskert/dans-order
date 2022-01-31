module DansOrder.DifferenceSpec where

import DansOrder.Difference
import DansOrder.Tone
import Test.Hspec

spec :: Spec
spec = do
  it "tonDifference" $ do
    tonDifference C C `shouldBe` 0
    tonDifference C Csharp `shouldBe` 1
    tonDifference C D `shouldBe` 2
    tonDifference D C `shouldBe` 2
    tonDifference Csharp D `shouldBe` 1
    tonDifference Fsharp Csharp `shouldBe` 5
    tonDifference Fsharp H `shouldBe` 5
    tonDifference H C `shouldBe` 1
    tonDifference C H `shouldBe` 1
    tonDifference A C `shouldBe` 3

  it "difference" $ do
    difference [E, A, D, G, H, E] [E, A, D, G, H, E] `shouldBe` 0
    difference [E, A, D, G, H, E] [D, A, D, Fsharp, A, D] `shouldBe` 7
    difference [D, A, D, Fsharp, A, D] [D, A, D, G, A, D] `shouldBe` 1
    difference [E, A, D, G, H, E] [D, A, D, G, A, D] `shouldBe` 6

  it "costs" $ do
    costs
      [ [A, A, A, A, A, A],
        [A, A, A, Gsharp, A, A],
        [A, A, A, Gsharp, B, A],
        [A, A, A, Gsharp, B, Gsharp],
        [A, A, A, Gsharp, B, G],
        [A, A, A, B, A, A],
        [A, A, A, B, B, A],
        [A, A, A, B, B, B],
        [A, A, A, B, B, H]
      ]
      `shouldBe` 12
    costs [[A, A, A, A, A, A], [A, A, A, Gsharp, A, A], [A, A, A, Gsharp, B, A], [A, A, A, Gsharp, B, Gsharp], [A, A, A, Gsharp, B, G], [A, A, A, B, B, A], [A, A, A, B, A, A], [A, A, A, B, B, B], [A, A, A, B, B, H]]
      `shouldBe` 12
    costs [[A, A, A, B, A, A], [A, A, A, B, B, A], [A, A, A, B, B, B], [A, A, A, B, B, H], [A, A, A, Gsharp, B, A], [A, A, A, Gsharp, A, A], [A, A, A, Gsharp, B, Gsharp], [A, A, A, Gsharp, B, G]]
      `shouldBe` 11
    costs [[A, A, A, B, A, A], [A, A, A, B, B, A], [A, A, A, B, B, B], [A, A, A, B, B, H], [A, A, A, Gsharp, B, A], [A, A, A, Gsharp, A, A], [A, A, A, Gsharp, B, Gsharp], [A, A, A, Gsharp, B, G]]
      `shouldBe` 11
    costs [[A, A, A, B, A, A], [A, A, A, A, A, A], [A, A, A, Gsharp, A, A], [A, A, A, Gsharp, B, A], [A, A, A, Gsharp, B, Gsharp], [A, A, A, Gsharp, B, G], [A, A, A, B, B, A], [A, A, A, B, B, B], [A, A, A, B, B, H]]
      `shouldBe` 11
    costs
      [ [A, A, A, B, A, A],
        [A, A, A, Gsharp, B, G],
        [A, A, A, B, B, A],
        [A, A, A, Gsharp, B, Gsharp],
        [A, A, A, B, B, H],
        [A, A, A, Gsharp, B, A],
        [A, A, A, A, A, A],
        [A, A, A, Gsharp, A, A],
        [A, A, A, B, B, B]
      ]
      `shouldBe` 28
    costs
      [ [A, A, A, B, A, A],
        [A, A, A, B, B, A],
        [A, A, A, B, B, B],
        [A, A, A, B, B, H],
        [A, A, A, A, A, A],
        [A, A, A, Gsharp, A, A],
        [A, A, A, Gsharp, B, A],
        [A, A, A, Gsharp, B, Gsharp],
        [A, A, A, Gsharp, B, G]
      ]
      `shouldBe` 11
    costs
      [ [A, A, A, B, A, A],
        [A, A, A, B, B, A],
        [A, A, A, B, B, B],
        [A, A, A, B, B, H],
        [A, A, A, B, B, C],
        [A, A, A, A, A, A],
        [A, A, A, Gsharp, A, A],
        [A, A, A, Gsharp, B, A],
        [A, A, A, Gsharp, B, Gsharp],
        [A, A, A, Gsharp, B, G]
      ]
      `shouldBe` 13
    costs
      [ [A, A, A, A, A, A],
        [A, A, A, B, A, A],
        [A, A, A, B, B, A],
        [A, A, A, B, B, B],
        [A, A, A, B, B, H],
        [A, A, A, B, B, C],
        [A, A, A, Gsharp, A, A],
        [A, A, A, Gsharp, B, A],
        [A, A, A, Gsharp, B, Gsharp],
        [A, A, A, Gsharp, B, G]
      ]
      `shouldBe` 14
    costs
      [ [A, A, A, Gsharp, B, G],
        [A, A, A, Gsharp, B, Gsharp],
        [A, A, A, Gsharp, B, A],
        [A, A, A, Gsharp, A, A],
        [A, A, A, A, A, A],
        [A, A, A, B, A, A],
        [A, A, A, B, B, A],
        [A, A, A, B, B, B],
        [A, A, A, B, B, H]
      ]
      `shouldBe` 8
    costs
      [[A, A, A, B, B, H], [A, A, A, B, B, B], [A, A, A, B, B, A], [A, A, A, B, A, A], [A, A, A, A, A, A], [A, A, A, Gsharp, A, A], [A, A, A, Gsharp, B, A], [A, A, A, Gsharp, B, Gsharp], [A, A, A, Gsharp, B, G]]
      `shouldBe` 8

    costs [[Fsharp, A, D, G, H, E], [E, A, D, G, H, E], [D, A, Csharp, E, H, E], [D, A, D, Fsharp, A, D], [D, G, D, G, A, D], [C, G, D, G, A, D], [H, G, D, G, A, D], [C, G, C, G, A, D], [Dsharp, B, C, G, B, D]]
      `shouldBe` 31

    costs
      [ [D, A, D, Fsharp, A, D],
        [H, G, D, G, A, D],
        [C, G, D, G, A, D],
        [D, G, D, G, A, D],
        [C, G, C, G, A, D],
        [Dsharp, B, C, G, B, D],
        [Fsharp, A, D, G, H, E],
        [D, A, Csharp, E, H, E],
        [E, A, D, G, H, E]
      ]
      `shouldBe` 43

main = hspec spec
