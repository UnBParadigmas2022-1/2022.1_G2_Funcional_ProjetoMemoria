module Jogo.Jogo(
    rodaJogo
    ) where 

import Carta.Carta

rodaJogo :: IO ()
rodaJogo = 
    do 
        geraBaralho 
        putStrLn "Jogando..."