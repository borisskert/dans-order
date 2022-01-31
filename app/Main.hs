module Main where

import DansOrder.Json (fromJson, toJson)
import System.Environment
import DansOrder (dansOrders)

main :: IO ()
main = do
  args <- getArgs
  putStrLn (concatMap toJson . dansOrders . fromJson . head $ args)
