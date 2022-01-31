module DansOrderSpec where

import DansOrder
import Test.Hspec

spec :: Spec
spec = do
  it "parseInput" $ do
    parseInput [] `shouldBe` []
    parseInput ["EADGHE", "DADF#AD", "DADGAD"]
      `shouldBe` [[E, A, D, G, H, E], [D, A, D, Fsharp, A, D], [D, A, D, G, A, D]]

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

  it "sortByPivot" $ do
    sortByPivot [E, A, D, G, H, E] [[E, A, D, G, H, E], [D, A, D, Fsharp, A, D], [D, A, D, G, A, D]]
      `shouldBe` [[E, A, D, G, H, E], [D, A, D, G, A, D], [D, A, D, Fsharp, A, D]]
    sortByPivot
      [A, A, A, A, A, A]
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
      `shouldBe` [[A, A, A, A, A, A], [A, A, A, Gsharp, A, A], [A, A, A, Gsharp, B, A], [A, A, A, Gsharp, B, Gsharp], [A, A, A, Gsharp, B, G], [A, A, A, B, B, A], [A, A, A, B, A, A], [A, A, A, B, B, B], [A, A, A, B, B, H]]
    sortByPivot
      [A, A, A, B, A, A]
      [ [A, A, A, Gsharp, A, A],
        [A, A, A, Gsharp, B, A],
        [A, A, A, Gsharp, B, Gsharp],
        [A, A, A, Gsharp, B, G],
        [A, A, A, B, A, A],
        [A, A, A, B, B, A],
        [A, A, A, B, B, B],
        [A, A, A, B, B, H]
      ]
      `shouldBe` [[A, A, A, B, A, A], [A, A, A, B, B, A], [A, A, A, B, B, B], [A, A, A, B, B, H], [A, A, A, Gsharp, B, A], [A, A, A, Gsharp, A, A], [A, A, A, Gsharp, B, Gsharp], [A, A, A, Gsharp, B, G]]
    sortByPivot
      [A, A, A, B, A, A]
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
      `shouldBe` [[A, A, A, B, A, A], [A, A, A, A, A, A], [A, A, A, Gsharp, A, A], [A, A, A, Gsharp, B, A], [A, A, A, Gsharp, B, Gsharp], [A, A, A, Gsharp, B, G], [A, A, A, B, B, A], [A, A, A, B, B, B], [A, A, A, B, B, H]]
    sortByPivot
      [A, A, A, B, A, A]
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
      `shouldBe` [[A, A, A, B, A, A], [A, A, A, B, B, A], [A, A, A, B, B, B], [A, A, A, B, B, H], [A, A, A, A, A, A], [A, A, A, Gsharp, A, A], [A, A, A, Gsharp, B, A], [A, A, A, Gsharp, B, Gsharp], [A, A, A, Gsharp, B, G]]
    sortByPivot
      [A, A, A, B, A, A]
      [ [A, A, A, B, A, A],
        [A, A, A, Gsharp, B, G],
        [A, A, A, B, B, A],
        [A, A, A, B, B, C],
        [A, A, A, Gsharp, B, Gsharp],
        [A, A, A, B, B, H],
        [A, A, A, Gsharp, B, A],
        [A, A, A, A, A, A],
        [A, A, A, Gsharp, A, A],
        [A, A, A, B, B, B]
      ]
      `shouldBe` [[A, A, A, B, A, A], [A, A, A, B, B, A], [A, A, A, B, B, B], [A, A, A, B, B, H], [A, A, A, B, B, C], [A, A, A, A, A, A], [A, A, A, Gsharp, A, A], [A, A, A, Gsharp, B, A], [A, A, A, Gsharp, B, Gsharp], [A, A, A, Gsharp, B, G]]

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

  it "danSort" $ do
    danSort
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
      `shouldBe` [[A, A, A, Gsharp, B, G], [A, A, A, Gsharp, B, Gsharp], [A, A, A, Gsharp, B, A], [A, A, A, Gsharp, A, A], [A, A, A, A, A, A], [A, A, A, B, A, A], [A, A, A, B, B, A], [A, A, A, B, B, B], [A, A, A, B, B, H]]
    danSort
      [ [A, A, A, B, A, A],
        [A, A, A, B, B, A],
        [A, A, A, Gsharp, B, Gsharp],
        [A, A, A, B, B, H],
        [A, A, A, Gsharp, B, A],
        [A, A, A, A, A, A],
        [A, A, A, Gsharp, A, A],
        [A, A, A, Gsharp, B, G],
        [A, A, A, B, B, B]
      ]
      `shouldBe` [[A, A, A, B, B, H], [A, A, A, B, B, B], [A, A, A, B, B, A], [A, A, A, B, A, A], [A, A, A, A, A, A], [A, A, A, Gsharp, A, A], [A, A, A, Gsharp, B, A], [A, A, A, Gsharp, B, Gsharp], [A, A, A, Gsharp, B, G]]

  it "dansOrders" $ do
    dansOrders
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
      `shouldBe` [ [[A, A, A, Gsharp, B, G], [A, A, A, Gsharp, B, Gsharp], [A, A, A, Gsharp, B, A], [A, A, A, Gsharp, A, A], [A, A, A, A, A, A], [A, A, A, B, A, A], [A, A, A, B, B, A], [A, A, A, B, B, B], [A, A, A, B, B, H]]
                 ]

  it "toString" $ do
    toString [C, Csharp, D, Dsharp, E, F, Fsharp, G, Gsharp, A, B, H]
      `shouldBe` "CC#DD#EFF#GG#ABH"

  it "estimateDansOrder" $ do
    estimateDansOrder
      [ "AAABAA",
        "AAAG#BG",
        "AAABBA",
        "AAAG#BG#",
        "AAABBH",
        "AAAG#BA",
        "AAAAAA",
        "AAAG#AA",
        "AAABBB"
      ]
      `shouldBe` [ ["AAAG#BG", "AAAG#BG#", "AAAG#BA", "AAAG#AA", "AAAAAA", "AAABAA", "AAABBA", "AAABBB", "AAABBH"]
                 ]
    estimateDansOrder
      [ "EADGHE",
        "DADF#AD",
        "DADGAD"
      ]
      `shouldBe` [["EADGHE", "DADGAD", "DADF#AD"]]

main = hspec spec
