import System.Random

main = do
    putStrLn "Введите S:"
    ch <- getLine
    putStrLn "Считаем:"
    game True (read ch :: Integer)

game :: Bool -> Integer -> IO()
game first s = do
    if s == 0 then do
        putStrLn "Нельзя сделать ход!"
        putStrLn ("Победа " ++ (if first then "первой" else "второй") ++ " обезьянки!")
     else do
        value <- randomRIO (1, min 3 s)
        let s_new = s - value
        putStrLn ((if first then "Первая" else "Вторая") ++ " обезьяна взяла " ++ (show value) ++ " " ++ (if value == 1 then "банан" else "банана") ++ " из кучи.")
        putStrLn ("Осталось бананов: " ++ (show (s_new)) ++ ".")
        putStrLn ""
        game (not first) (s_new)