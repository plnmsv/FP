module Func where
import Data.List
import Data.Monoid
func n = [x | x <- [1..( n - 1)], rem n x == 0]
func2 a = filter (<a) r
     where r = [n | n <- [1..1000], sum (func n) == n]  