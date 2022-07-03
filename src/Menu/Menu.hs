module Menu.Menu( 
    desenhaMenu,
    escolheDificuldade, 
    escolheJogadores
    ) where 

import Jogo.Jogo ( rodaJogo )
import Jogador.Jogador
import Dificuldade.Dificuldade

desenhaMenu :: IO ()
desenhaMenu = do
  putStrLn "============= JOGO DA MEMÓRIA ============="
  putStrLn "|                                         |"
  putStrLn "|  <1> Pressione 1 para jogar             |"
  putStrLn "|  <2> Pressione 2 para sair do programa  |"
  putStrLn "|                                         |"
  putStrLn "==========================================="
  escolha <- getLine

  if escolha == "2"
    then putStrLn "Saindo..."
    else if escolha == "1"
    then escolheJogadores
    else do 
        putStrLn "Escolha alguma opção do Menu"
        desenhaMenu

escolheDificuldade :: [Jogador] -> IO ()
escolheDificuldade jogadores = do
  putStrLn "-- DIFICULDADE --"
  putStrLn "<1> Fácil"
  putStrLn "<2> Média"
  putStrLn "<3> Difícil"
  putStrLn "<5> Sair"
  escolhaD <- getLine

  if(escolhaD == "1" || escolhaD == "2" || escolhaD == "3") then do
    let dificuldade = geraDificuldade (read escolhaD :: Int)
    rodaJogo dificuldade jogadores
    else if escolhaD == "5"
      then putStrLn "Saindo..."
      else do
        putStrLn "Escolha alguma opção do Menu"
        escolheDificuldade jogadores

escolheJogadores :: IO ()
escolheJogadores = do
  putStrLn "-- JOGADORES --"
  putStrLn "JOGADOR 1 [NOME]: "
  nome1 <- getLine
  let jogador1 = geraJogador nome1 1 0

  putStrLn "ADICIONAR MAIS UM JOGADOR"
  putStrLn "<1> Jogar individualmente"
  putStrLn "<2> Adicionar novo jogador"

  escolhaJ <- getLine

  if escolhaJ == "1"
  then do
    putStrLn "APENAS UM JOGADOR"
    escolheDificuldade [jogador1]
  else do
    putStrLn "JOGADOR 2 [NOME]: "
    nome2 <- getLine
    let jogador2 = geraJogador nome2 2 0
    escolheDificuldade ([jogador1] ++ [jogador2])
