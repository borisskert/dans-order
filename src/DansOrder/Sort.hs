module DansOrder.Sort where

import DansOrder.Difference
import DansOrder.Tuning
import Data.List (groupBy, nubBy, sortBy, sortOn)

sortByPivot :: Tuning -> [Tuning] -> [Tuning]
sortByPivot _ [x] = [x]
sortByPivot pivot xs = pivot : sortByPivot (head sorted) sorted
  where
    sorted = sortBy (\a b -> compare (difference pivot a) (difference pivot b)) . filter (/= pivot) $ xs :: [Tuning]

danSort :: [Tuning] -> [Tuning]
danSort xs = head . sortOn costs . map (`sortByPivot` xs) $ xs

same :: [Tuning] -> [Tuning] -> Bool
same a b = a == b || a == reverse b

sameCosts :: [Tuning] -> [Tuning] -> Bool
sameCosts a b = costs a == costs b

dansOrders :: [Tuning] -> [[Tuning]]
dansOrders [] = []
dansOrders xs =
  nubBy same
    . head
    . groupBy sameCosts
    . sortOn costs
    . map (`sortByPivot` xs)
    $ xs
