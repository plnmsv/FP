module Main where

import Data.List
import System.Random 
    
main :: IO () 
main = do
    putStrLn "Game\"Bulls and Cows\"." 
    e <- randomRIO (1000::Int,9999)
    let y = show e
    let game = do
            putStr "Vvedite vashe chislo:\n"
            x <- getLine
            case reads x of
                [(a,[])] | a>=(1000::Int) && a<=9999 -> 
                    let b= map fst $ filter (uncurry (==)) $ zip x y in
                    if length b == 4 then putStrLn "You won!"
                    else do
                        let c = foldl (\ acc q -> if q `elem` y then q:acc else acc) "" x
                            c' = c \\ b
                            prep = ('[':) . (++"]") . intersperse ',' . sort 
                        putStrLn $ concat ["Bulls ", prep b, ";  cows ", prep c']
                        game
                _ -> putStrLn "Enter number 1000-9999." >> game
    game