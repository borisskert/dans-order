module DansOrder.Parse where

import DansOrder.Tuning
import DansOrder.Tone

toTon :: Char -> Tone
toTon 'C' = C
toTon 'D' = D
toTon 'E' = E
toTon 'F' = F
toTon 'G' = G
toTon 'A' = A
toTon 'B' = B
toTon 'H' = H
toTon _ = error "Should never ever happen"

toSharp :: Char -> Tone
toSharp 'C' = Csharp
toSharp 'D' = Dsharp
toSharp 'F' = Fsharp
toSharp 'G' = Gsharp
toSharp 'A' = B
toSharp _ = error "Should never ever happen"

toStimmung :: [Char] -> Tuning
toStimmung [] = []
toStimmung toene
  | ton == '#' = toStimmung beforeSharp ++ [toSharp sharp]
  | otherwise = toStimmung nextToene ++ [toTon ton]
  where
    ton = last toene :: Char
    sharp = last . init $ toene :: Char
    beforeSharp = init nextToene :: [Char]
    nextToene = init toene :: [Char]

parseInput :: [String] -> [Tuning]
parseInput = map toStimmung
