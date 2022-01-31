module DansOrder where

import Data.List (sortBy, sortOn, groupBy)
import Data.List.Split (divvy)

data Ton = C | Csharp | D | Dsharp | E | F | Fsharp | G | Gsharp | A | B | H deriving (Eq, Show)

type Stimmung = [Ton]

toTon :: Char -> Ton
toTon 'C' = C
toTon 'D' = D
toTon 'E' = E
toTon 'F' = F
toTon 'G' = G
toTon 'A' = A
toTon 'B' = B
toTon 'H' = H

toSharp :: Char -> Ton
toSharp 'C' = Csharp
toSharp 'D' = Dsharp
toSharp 'F' = Fsharp
toSharp 'G' = Gsharp

toStimmung :: [Char] -> Stimmung
toStimmung [] = []
toStimmung toene
  | ton == '#' = toStimmung beforeSharp ++ [toSharp sharp]
  | otherwise = toStimmung nextToene ++ [toTon ton]
  where
    ton = last toene :: Char
    sharp = last . init $ toene :: Char
    beforeSharp = init nextToene :: [Char]
    nextToene = init toene :: [Char]

parseInput :: [String] -> [Stimmung]
parseInput = map toStimmung

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
difference (a : ax) (b : bx) = tonDifference a b + difference ax bx

costs :: [Stimmung] -> Int
costs = sum . map (\[a, b] -> difference a b) . divvy 2 1

sortByPivot :: Stimmung -> [Stimmung] -> [Stimmung]
sortByPivot _ [x] = [x]
sortByPivot pivot xs = pivot : sortByPivot (head sorted) sorted
  where
    sorted = sortBy (\a b -> compare (difference pivot a) (difference pivot b)) . filter (/= pivot) $ xs :: [Stimmung]

danSort :: [Stimmung] -> [Stimmung]
danSort xs = head . sortOn costs . map (`sortByPivot` xs) $ xs

dansOrders :: [Stimmung] -> [[Stimmung]]
dansOrders xs = head . groupBy (\a b -> costs a == costs b) . sortOn costs . map (`sortByPivot` xs) $ xs
