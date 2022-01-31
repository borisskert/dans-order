module DansOrder.Difference where

import DansOrder.Tone
import DansOrder.Tuning
import Data.List.Split (divvy)

tonDifference :: Tone -> Tone -> Int
tonDifference a b
  | a == b = 0
  | otherwise = minimum [differenceAtoB, differenceBtoA]
  where
    tones = cycle [C, Csharp, D, Dsharp, E, F, Fsharp, G, Gsharp, A, B, H] :: [Tone]
    differenceAtoB = length . takeWhile (/= b) . dropWhile (/= a) $ tones :: Int
    differenceBtoA = length . takeWhile (/= a) . dropWhile (/= b) $ tones :: Int

difference :: Tuning -> Tuning -> Int
difference [] [] = 0
difference [] _ = error "Should never ever happen"
difference _ [] = error "Should never ever happen"
difference (a : ax) (b : bx) = tonDifference a b + difference ax bx

costs :: [Tuning] -> Int
costs = sum . map (\[a, b] -> difference a b) . divvy 2 1
