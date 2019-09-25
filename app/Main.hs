module Main where


import Lib
import System.Environment


main :: IO ()
main = do
    args <- getArgs
    let a0 = read (args!!0) :: [Integer]
    let a1 = read (args!!1) :: Integer
    let a2 = read (args!!2) :: Integer
    basePrint (Number a0 a1) a2
