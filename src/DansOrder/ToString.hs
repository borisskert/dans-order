module DansOrder.ToString where

import DansOrder.Tuning
import DansOrder.Tone

tonToString :: Tone -> String
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

toString :: Tuning -> String
toString = concatMap tonToString
