module Jogo.Jogo(
    rodaJogo
    ) where

import Carta.Carta
import Dificuldade.Dificuldade

rodaJogo :: Int -> IO ()
rodaJogo n = do
    let dificuldade = geraDificuldade n
    let baralho = geraBaralho ((getNumeroCartas dificuldade) `div` 2) []
    print baralho