{-|
    Main.hs - Console program to transform a number from one base to another

    (C) 2020 Tim Gravert <crazymind102@googlemail.com>

    License: BSD 3-Clause
-}

{-# LANGUAGE OverloadedStrings #-}

module Main where


import Data.BaseNumber(basePrint,Number(Number))

import Control.Exception
import Data.Maybe
import System.Environment
import System.Exit

import qualified Text.Read as TR



main :: IO ()
main = do
    -- Arguments from the commandline
    args <- getArgs

    -- If less than 3 arguments exit with failure
    if length args < 3
        then do
            putStrLn "Please enter 3 arguments in the form of [digitsOfTheNumber] baseOfNumber baseYouWantToHave"
            exitWith (ExitFailure 1)
        else do
            return ()

    -- read the three arguments
    let a0 = TR.readMaybe (args!!0) :: Maybe [Integer]
    let a1 = TR.readMaybe (args!!1) :: Maybe Integer
    let a2 = TR.readMaybe (args!!2) :: Maybe Integer

    -- test if a0 is a List of Integers
    if isNothing a0
        then do
            putStrLn "One or more digits are not numbers. Please enter only numbers."
            exitWith (ExitFailure 2)
        else do
            return ()

    -- test if a1 is an Integer
    if isNothing a1
        then do
            putStrLn "Base is not a number. Please enter only numbers."
            exitWith (ExitFailure 2)
        else do
            return ()

    -- test if a2 is an Integer
    if isNothing a2
        then do
            putStrLn "Base is not a number. Please enter only numbers."
            exitWith (ExitFailure 2)
        else do
            return ()

    -- No error possible because we tested if any of these
    -- is Nothing.
    let arg0 = fromJust a0
    let arg1 = fromJust a1
    let arg2 = fromJust a2

    -- actual transformation of number
    basePrint (Number arg0 arg1) arg2
    exitSuccess
