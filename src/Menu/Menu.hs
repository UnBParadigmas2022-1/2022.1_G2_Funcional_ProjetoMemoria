module Menu.Menu( 
    desenhaMenu 
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
    then rodaJogo
    else do 
        putStrLn "Escolha alguma opção do Menu"
        desenhaMenu
