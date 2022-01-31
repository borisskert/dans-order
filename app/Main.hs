module Main where

import DansOrder.Json (fromJson, toJson)
import System.Environment

main :: IO ()
main = do
  args <- getArgs
  putStrLn (toJson . fromJson . head $ args)
