module Main where

import DansOrder.Args (Args, hasError, help, inputFile, inputText, readArgs)
import DansOrder.Json (fromJson, toJson)
import DansOrder.Sort (dansOrders)
import Data.Maybe (fromJust, isJust)
import GHC.Base (returnIO)
import System.Environment (getArgs)
import System.IO
import Text.Printf (printf)

main :: IO ()
main = do
  args <- getArgs
  output <- performArgs . readArgs $ args
  putStrLn output

performArgs :: Args -> IO String
performArgs args
  | hasError args || help args = returnIO helpText
  | isJust file = sortFileInput . fromJust $ file
  | isJust input = returnIO . sortInput . fromJust $ input
  | otherwise = returnIO helpText
  where
    file = inputFile args
    input = inputText args

helpText :: String
helpText =
  "dansorder - Dan's Order of Guitar Tunings\n\n"
    ++ "Usage: dansorder [JSON-INPUT]\n"
    ++ "                 [-f|--file JSON-INPUT-FILE]\n"
    ++ "                 [-h|--help]\n"
    ++ "\n"
    ++ "Available options:\n"
    ++ "  --help         Show this help text\n"
    ++ "  --file         Reads contents of a specified JSON file\n"

sortInput :: String -> String
sortInput = concatMap toJson . dansOrders . fromJson

sortFileInput :: String -> IO String
sortFileInput filename = do
  fileContents <- readFileContents filename
  return (concatMap toJson . dansOrders . fromJson $ fileContents)

readFileContents :: String -> IO String
readFileContents filename = do
  fileHandle <- openFile filename ReadMode
  hGetContents fileHandle
