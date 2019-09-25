{-# LANGUAGE UnicodeSyntax              #-}

module Lib
    ( base
    , basePrint
    , Number(..)
    ) where


import Data.Char.SScript

import Data.List as DL



data Number = Number [Integer] Integer deriving(Read)

instance Show Number where
    show (Number [] b) = (formatSS (add_ (show b)) )
    show (Number (x:xs) b)
      | b > 35 = "Number " ++ show (x:xs) ++ " " ++ show b
      | b > 10 && x > 9 = tx ++ show (Number xs b)
      | otherwise = show x ++ show (Number xs b)
        where tx = baseSymbols!!((fromIntegral x) - 10)

baseSymbols = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]

add_ :: String -> String
add_ [] = ""
add_ (x:xs) = "_" ++ [x] ++ (add_ xs)


base :: Number -> Integer -> Number
base n@(Number xs b0) b1
  | b0 == b1 = n
  | otherwise = from10 (fromDigits n 0 0) (Number [] b1)


fromDigits :: Number -> Integer -> Integer -> Integer
fromDigits (Number [] _) _ r = r
fromDigits (Number xs b) i r = fromDigits (Number (init xs) b) (i+1) (r + (b^i * (last xs)))


from10 :: Integer -> Number -> Number
from10 0 r = r
from10 n (Number xs b) = from10 (div n b) (Number ((mod n b) : xs) b)


basePrint :: Number -> Integer -> IO ()
basePrint x y = print (base x y)
