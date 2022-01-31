module DansOrder.Json where

import DansOrder.Parse
import DansOrder.Tuning
import DansOrder.ToString
import Text.JSON (Result (Error), decode)
import Text.JSON.Generic

fromJson :: String -> [Tuning]
fromJson input = convert decoded
  where
    decoded = decode input :: Result [String]

    convert :: Result [String] -> [Tuning]
    convert (Error message) = error message
    convert (Ok strings) = map toStimmung strings

toJson :: [Tuning] -> String
toJson stimmungen = encoded
  where
    encoded = encode . map toString $ stimmungen
