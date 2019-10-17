module Main where


import Lib
import System.Environment
import System.Exit



main :: IO ()
main = do
    args <- getArgs
    if length args < 3 then exitWith (ExitFailure 1) else return () 
    let a0 = read (args!!0) :: [Integer]
    let a1 = read (args!!1) :: Integer
    let a2 = read (args!!2) :: Integer
    basePrint (Number a0 a1) a2
    exitSuccess
