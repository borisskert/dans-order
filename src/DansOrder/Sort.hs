module DansOrder.Sort where

import DansOrder.Difference
import DansOrder.Stimmung
import Data.List (groupBy, nubBy, sortBy, sortOn)

sortByPivot :: Stimmung -> [Stimmung] -> [Stimmung]
sortByPivot _ [x] = [x]
sortByPivot pivot xs = pivot : sortByPivot (head sorted) sorted
  where
    sorted = sortBy (\a b -> compare (difference pivot a) (difference pivot b)) . filter (/= pivot) $ xs :: [Stimmung]

danSort :: [Stimmung] -> [Stimmung]
danSort xs = head . sortOn costs . map (`sortByPivot` xs) $ xs

same :: [Stimmung] -> [Stimmung] -> Bool
same a b = a == b || a == reverse b

sameCosts :: [Stimmung] -> [Stimmung] -> Bool
sameCosts a b = costs a == costs b

dansOrders :: [Stimmung] -> [[Stimmung]]
dansOrders [] = []
dansOrders xs =
  nubBy same
    . head
    . groupBy sameCosts
    . sortOn costs
    . map (`sortByPivot` xs)
    $ xs
