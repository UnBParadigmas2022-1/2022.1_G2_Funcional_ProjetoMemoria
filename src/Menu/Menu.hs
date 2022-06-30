module Menu.Menu( 
    desenhaMenu,
    escolheDificuldade
    ) where 

import Jogo.Jogo ( rodaJogo ) 

desenhaMenu :: IO ()
desenhaMenu = do
    putStrLn "-- MENU --"
    putStrLn "<1> Jogar"
    putStrLn "<2> Sair"
    escolha <- getLine

    if escolha == "2"
    then putStrLn "Saindo..."
    else if escolha == "1"
    then escolheDificuldade
    -- then rodaJogo
    else do 
        putStrLn "Escolha alguma opção do Menu"
        desenhaMenu

escolheDificuldade :: IO ()
escolheDificuldade = do
    putStrLn "-- DIFICULDADE --"
    putStrLn "<1> Fácil"
    putStrLn "<2> Média"
    putStrLn "<3> Difícil"
    putStrLn "<4> Extrema"
    putStrLn "<5> Sair"
    escolhaD <- getLine

    if escolhaD == "1"
    then rodaJogo 1
    else if escolhaD == "2"
    then rodaJogo 2
    else if escolhaD == "3"
    then rodaJogo 3
    else if escolhaD == "4"
    then rodaJogo 4
    else if escolhaD == "5"
    then putStrLn "Saindo..."
    -- then rodaJogo
    else do 
        putStrLn "Escolha alguma opção do Menu"
        escolheDificuldade

