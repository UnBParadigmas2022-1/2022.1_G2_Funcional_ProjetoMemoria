module Jogo.Jogo(
    rodaJogo
    ) where

import Carta.Carta

rodaJogo :: IO ()
rodaJogo = do
    let baralho = geraBaralho 3 []
    print baralho