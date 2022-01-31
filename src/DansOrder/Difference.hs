module DansOrder.Difference where

import DansOrder.Stimmung
import DansOrder.Ton
import Data.List.Split (divvy)

tonDifference :: Ton -> Ton -> Int
tonDifference a b
  | a == b = 0
  | otherwise = minimum [differenceAtoB, differenceBtoA]
  where
    tones = cycle [C, Csharp, D, Dsharp, E, F, Fsharp, G, Gsharp, A, B, H] :: [Ton]
    differenceAtoB = length . takeWhile (/= b) . dropWhile (/= a) $ tones :: Int
    differenceBtoA = length . takeWhile (/= a) . dropWhile (/= b) $ tones :: Int

difference :: Stimmung -> Stimmung -> Int
difference [] [] = 0
difference [] _ = error "Should never ever happen"
difference _ [] = error "Should never ever happen"
difference (a : ax) (b : bx) = tonDifference a b + difference ax bx

costs :: [Stimmung] -> Int
costs = sum . map (\[a, b] -> difference a b) . divvy 2 1
