{-# LANGUAGE UnicodeSyntax              #-}

module Data.BaseNumber
    ( base
    , basePrint
    , Number(..)
    ) where


import Data.Char.SScript

import Data.List as DL



-- | Representation of numbers
data Number = 
    Number    -- ^ Constructor
    [Integer] -- ^ Digits of the number
    Integer   -- ^ Base of the number
    deriving(Read)

-- | Instance of Show for Number
instance Show Number where
    show (Number [] b) = (formatSS (add_ (show b)) )
    show (Number (x:xs) b)
      | b > 35 = "Number " ++ show (x:xs) ++ " " ++ show b
      | b > 10 && x > 9 = tx ++ show (Number xs b)
      | otherwise = show x ++ show (Number xs b)
        where tx = baseSymbols!!((fromIntegral x) - 10)

-- | Symbols for bases up to 36
baseSymbols = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]

-- | Helper function for instance of Show for Number
add_ :: String -> String
add_ [] = ""
add_ (x:xs) = "_" ++ [x] ++ (add_ xs)


-- | Function for base transformation
base :: Number -> Integer -> Number
base n@(Number xs b0) b1
  | b0 == b1 = n
  | otherwise = from10 (to10 n 0 0) (Number [] b1)


-- | Function to transform a Number to an Integer
--   which is in base10.
to10 :: Number -> Integer -> Integer -> Integer
to10 (Number [] _) _ r = r
to10 (Number xs b) i r = to10 (Number (init xs) b) (i+1) (r + (b^i * (last xs)))


-- | Function to transform an Integer to a Number
from10 :: Integer -> Number -> Number
from10 0 r = r
from10 n (Number xs b) = from10 (div n b) (Number ((mod n b) : xs) b)


-- | Function to print the result of base transformation
basePrint :: Number -> Integer -> IO ()
basePrint x y = print (base x y)
