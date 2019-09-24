module Lib
    ( base
    , basePrint
    , Number(..)
    ) where



import Data.List as DL



data Number a = Number [a] a deriving(Read, Show)


base :: (Eq a, Integral a, Num a) => Number a -> a -> Number a
base n@(Number xs b0) b1
  | b0 == b1 = n
  | otherwise = from10 (fromDigits n 0 0) (Number [] b1)


fromDigits :: (Integral a, Num a) => Number a -> a -> a -> a
fromDigits (Number [] _) _ r = r
fromDigits (Number xs b) i r = fromDigits (Number (init xs) b) (i+1) (r + (b^i * (last xs)))


from10 :: (Integral a, Num a) => a -> Number a -> Number a
from10 0 r = r
from10 n (Number xs b) = from10 (div n b) (Number ((mod n b) : xs) b)


--type baseSymbols = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]


basePrint :: (Integral a, Num a, Show a) => Number a -> a -> IO ()
basePrint x y = print (base x y)
