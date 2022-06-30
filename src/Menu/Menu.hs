module Menu.Menu( 
    desenhaMenu,
    escolheDificuldade, 
    escolheJogadores
    ) where 

import Jogo.Jogo ( rodaJogo ) 
import Jogador.Jogador

desenhaMenu :: IO ()
desenhaMenu = do
    putStrLn "-- MENU --"
    putStrLn "<1> Jogar"
    putStrLn "<2> Sair"
    escolha <- getLine

    if escolha == "2"
    then putStrLn "Saindo..."
    else if escolha == "1"
    then escolheJogadores
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

escolheJogadores :: IO ()
escolheJogadores = do
    putStrLn "-- JOGADORES --"
    putStrLn "JOGADOR 1 [NOME]: "
    nome1 <- getLine
    let jogador1 = geraJogador nome1 1
    print jogador1

    putStrLn "ADICIONAR MAIS UM JOGADOR"
    putStrLn "<1> Jogar individualmente"
    putStrLn "<2> Adicionar novo jogador"
    
    escolhaJ <- getLine

    if escolhaJ == "1"
    then putStrLn "APENAS UM JOGADOR"
    else do 
        putStrLn "JOGADOR 2 [NOME]: "
        nome2 <- getLine
        let jogador2 = geraJogador nome2 2
        print jogador2


    escolheDificuldade