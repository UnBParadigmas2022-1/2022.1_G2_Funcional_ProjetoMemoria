module Menu.Menu(
    desenhaMenu
    ) where

import Jogo.Jogo ( rodaJogo )
import Jogador.Jogador (
  geraJogador
  ,Jogador
  )
import Dificuldade.Dificuldade(
  geraDificuldade
  ,Dificuldade
  )

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
  putStrLn "=============== DIFICULDADE ==============="
  putStrLn "|                                         |"
  putStrLn "|  <1> Pressione 1 para facil             |"
  putStrLn "|  <2> Pressione 2 para media             |"
  putStrLn "|  <3> Pressione 3 para dificil           |"
  putStrLn "|  <4> Pressione 3 para sair              |"
  putStrLn "|                                         |"
  putStrLn "==========================================="
  escolhaD <- getLine

  if escolhaD == "1" || escolhaD == "2" || escolhaD == "3"
    then do
      let dificuldade = geraDificuldade (read escolhaD :: Int)
      rodaJogo dificuldade jogadores
  else if escolhaD == "4" 
    then putStrLn "Saindo..."
  else do
    putStrLn "Escolha alguma opção do Menu"
    escolheDificuldade jogadores

escolheJogadores :: IO ()
escolheJogadores = do
  putStrLn "================ JOGADORES ================"
  putStrLn "|                                         |"
  putStrLn "|  <1> Pressione 1 para apenas um jogador |"
  putStrLn "|  <2> Pressione 2 para dois jogadores    |"
  putStrLn "|                                         |"
  putStrLn "==========================================="
  escolhaJ <- getLine
  if escolhaJ == "1" 
    then do
      putStrLn "--> Digite o seu nome: "
      nomeJogador1 <- getLine
      let jogador1 = geraJogador nomeJogador1 1 0
      escolheDificuldade [jogador1]
  else if escolhaJ == "2" 
    then do
      putStrLn "--> Digite o nome do primeiro jogador: "
      nomeJogador1 <- getLine
      let jogador1 = geraJogador nomeJogador1 1 0
      putStrLn "--> Digite o nome do segundo jogador: "
      nomeJogador2 <- getLine
      let jogador2 = geraJogador nomeJogador2 2 0
      escolheDificuldade (jogador1 : [jogador2])
  else do
    putStrLn "--> Escolha uma opcao valida"
    escolheJogadores
