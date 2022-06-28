module Jogo.Jogo(
    rodaJogo
    ) where

import Carta.Carta
import Tabuleiro.Tabuleiro

rodaJogo :: IO ()
rodaJogo = do
    let baralho = geraBaralho 3 []
    let tabuleiro = geraTabuleiro baralho
    rodada tabuleiro
    fimJogo tabuleiro

fimJogo :: [[Carta]] -> IO ()
fimJogo tabuleiro = putStrLn "Fim do jogo."

-- TODO rodada:
-- 
rodada :: [[Carta]] -> IO ()
rodada tabuleiro = do
    desenhaTabuleiro tabuleiro
    -- let jogada1 = abreCarta tabuleiro
    putStrLn "Você errou"
    -- let jogada2 = abreCarta (tabuleiro jogada1)
--     if valor (carta jogada1) == valor (carta jogada2)
--     then do
--         putStrLn "Você acertou"
--         rodada (tabuleiro jogada2)
--     else do
--         desenhaTabuleiro escondeCartas (tabuleiro jogada2)
--         putStrLn "Você errou"

-- TODO abreCarta
-- escolhe a carta
-- pega a coordenada
-- com a coordenada pega a carta e atualiza o tabuleiro
-- desenha o tabuleiro 
-- retorna jogada
-- abreCarta :: [[Carta]] -> Coordenada
-- abreCarta tabuleiro = do
--     putStrLn "Escolha uma carta:"
--     escolha <- getLine
--     pegaCoordenada escolha
--     let jogada = pegaCarta coordenada
--     desenhaTabuleiro (tabuleiro jogada)
--     jogada