module DansOrder.ArgsSpec where

import DansOrder.Args (Args (Args), hasError, help, inputFile, inputText, readArgs)
import Test.Hspec

spec :: Spec
spec = do
  it "readArgs" $ do
    readArgs [] `shouldBe` (Args {inputFile = Nothing, inputText = Nothing, help = False, hasError = False})
    readArgs ["test input"] `shouldBe` (Args {inputFile = Nothing, inputText = Just "test input", help = False, hasError = False})
    readArgs ["-f", "test_file.json"] `shouldBe` (Args {inputFile = Just "test_file.json", inputText = Nothing, help = False, hasError = False})
    readArgs ["--file", "test_file.json"] `shouldBe` (Args {inputFile = Just "test_file.json", inputText = Nothing, help = False, hasError = False})
    readArgs ["--help"] `shouldBe` (Args {inputFile = Nothing, inputText = Nothing, help = True, hasError = False})
    readArgs ["-h"] `shouldBe` (Args {inputFile = Nothing, inputText = Nothing, help = True, hasError = False})
    readArgs ["--unknown"] `shouldBe` (Args {inputFile = Nothing, inputText = Nothing, help = False, hasError = True})
    readArgs ["--file"] `shouldBe` (Args {inputFile = Nothing, inputText = Nothing, help = False, hasError = True})
    readArgs ["-f"] `shouldBe` (Args {inputFile = Nothing, inputText = Nothing, help = False, hasError = True})

main = hspec spec
