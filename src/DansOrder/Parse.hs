module DansOrder.Parse where

import DansOrder.Stimmung
import DansOrder.Ton

toTon :: Char -> Ton
toTon 'C' = C
toTon 'D' = D
toTon 'E' = E
toTon 'F' = F
toTon 'G' = G
toTon 'A' = A
toTon 'B' = B
toTon 'H' = H
toTon _ = error "Should never ever happen"

toSharp :: Char -> Ton
toSharp 'C' = Csharp
toSharp 'D' = Dsharp
toSharp 'F' = Fsharp
toSharp 'G' = Gsharp
toSharp 'A' = B
toSharp _ = error "Should never ever happen"

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
