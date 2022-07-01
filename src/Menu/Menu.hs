module Menu.Menu
  ( desenhaMenu,
  )
where

import Jogo.Jogo (rodaJogo)

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
    else
      if escolha == "1"
        then rodaJogo
        else do
          putStrLn "Escolha alguma opção do Menu"
          desenhaMenu
