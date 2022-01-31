module DansOrder.ToString where

import DansOrder.Stimmung
import DansOrder.Ton

tonToString :: Ton -> String
tonToString C = "C"
tonToString Csharp = "C#"
tonToString D = "D"
tonToString Dsharp = "D#"
tonToString E = "E"
tonToString F = "F"
tonToString Fsharp = "F#"
tonToString G = "G"
tonToString Gsharp = "G#"
tonToString A = "A"
tonToString B = "B"
tonToString H = "H"

toString :: Stimmung -> String
toString = concatMap tonToString
