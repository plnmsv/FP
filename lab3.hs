import Data.List 
import Data.Monoid 
f lst = filter (`elem` ["0", "1", "2","3", "4", "5", "6", "7", "8", "9"]) lst
