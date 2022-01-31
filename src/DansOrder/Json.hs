module DansOrder.Json where

import DansOrder (Stimmung, toStimmung, toString)
import Text.JSON (Result (Error), decode)
import Text.JSON.Generic

fromJson :: String -> [Stimmung]
fromJson input = convert decoded
  where
    decoded = decode input :: Result [String]

    convert :: Result [String] -> [Stimmung]
    convert (Error message) = error message
    convert (Ok strings) = map toStimmung strings

toJson :: [Stimmung] -> String
toJson stimmungen = encoded
  where
    encoded = encode . map toString $ stimmungen
