module DansOrder.SortSpec where

import DansOrder.Sort
import DansOrder.Tone
import Test.Hspec

spec :: Spec
spec = do
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

  it "should dan's example sortByPivot" $ do
    sortByPivot
      [D, A, D, Fsharp, A, D]
      [ [D, A, D, Fsharp, A, D],
        [E, A, D, G, H, E],
        [C, G, D, G, A, D],
        [Dsharp, B, C, G, B, D],
        [D, G, D, G, A, D],
        [Fsharp, A, D, G, H, E],
        [H, G, D, G, A, D],
        [D, A, Csharp, E, H, E],
        [C, G, C, G, A, D]
      ]
      `shouldBe` [ [D, A, D, Fsharp, A, D],
                   [D, G, D, G, A, D],
                   [C, G, D, G, A, D],
                   [H, G, D, G, A, D],
                   [C, G, C, G, A, D],
                   [Dsharp, B, C, G, B, D],
                   [E, A, D, G, H, E],
                   [Fsharp, A, D, G, H, E],
                   [D, A, Csharp, E, H, E]
                 ]

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

  it "dansOrders: some fictive example" $ do
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

  it "dansOrders: should sort dan's first example" $ do
    dansOrders [[D, A, D, Fsharp, A, D], [E, A, D, G, H, E], [C, G, D, G, A, D], [Dsharp, B, C, G, B, D], [D, G, D, G, A, D], [Fsharp, A, D, G, H, E], [H, G, D, G, A, D], [D, A, Csharp, E, H, E], [C, G, C, G, A, D]]
      `shouldBe` [ [[Fsharp, A, D, G, H, E], [E, A, D, G, H, E], [D, A, Csharp, E, H, E], [D, A, D, Fsharp, A, D], [D, G, D, G, A, D], [C, G, D, G, A, D], [H, G, D, G, A, D], [C, G, C, G, A, D], [Dsharp, B, C, G, B, D]]
                 ]

  it "dansOrders: should handle empty list" $ do
    dansOrders [] `shouldBe` []

main = hspec spec
