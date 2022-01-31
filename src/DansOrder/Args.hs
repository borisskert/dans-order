module DansOrder.Args (Args(Args), hasError, help, inputFile, inputText, readArgs) where

import System.IO (withFile)
import Data.List (isPrefixOf)

data Args = Args
  { inputFile :: Maybe String,
    inputText :: Maybe String,
    help :: Bool,
    hasError :: Bool
  }
  deriving (Eq, Show)

empty :: Args
empty = Args {inputFile = Nothing, inputText = Nothing, help = False, hasError = False}

withHelp :: Args -> Args
withHelp Args {inputFile = inputFile, inputText = inputText, help = _} =
  Args {inputFile = inputFile, inputText = inputText, help = True, hasError = False}

withError :: Args -> Args
withError Args {inputFile = inputFile, inputText = inputText, help = help, hasError = _} =
  Args {inputFile = inputFile, inputText = inputText, help = False, hasError = True}

withInputFile :: Args -> String -> Args
withInputFile Args {inputFile = _, inputText = inputText, help = help} inputFile =
  Args {inputFile = Just inputFile, inputText = inputText, help = help, hasError = False}

withInput :: Args -> String -> Args
withInput Args {inputFile = inputFile, inputText = _, help = help} input =
  Args {inputFile = inputFile, inputText = Just input, help = help, hasError = False}

readArgs :: [String] -> Args
readArgs args = readArgs' args empty
  where
    readArgs' :: [String] -> Args -> Args
    readArgs' [] args = args
    readArgs' (x : xs) args
      | (x == "-f" || x == "--file") && (not . null $ xs) = withInputFile args (head xs)
      | x == "-h" || x == "--help" = withHelp args
      | "-" `isPrefixOf` x = withError args
      | null xs = withInput args x
      | otherwise = withError args
