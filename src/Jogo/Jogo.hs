module Jogo.Jogo(
    rodaJogo
    ) where

import System.Random ( newStdGen )

import Carta.Carta ( geraBaralho, Carta )
import Tabuleiro.Tabuleiro
    ( desenhaTabuleiro, pegaCoordenada, Coordenada, geraTabuleiro, pegaCarta )
import Dificuldade.Dificuldade

rodaJogo :: Int -> IO ()
rodaJogo n = do
    let dificuldade = geraDificuldade n
    let baralho = geraBaralho ((getNumeroCartas dificuldade) `div` 2) []
    gen <- newStdGen
    let tabuleiro = geraTabuleiro gen (getLargura dificuldade) (baralho ++ baralho)
    rodada tabuleiro
    fimJogo tabuleiro

fimJogo :: [[Carta]] -> IO ()
fimJogo tabuleiro = putStrLn "Fim do jogo."

-- TODO rodada:
-- 
rodada :: [[Carta]] -> IO ()
rodada tabuleiro = do
    desenhaTabuleiro tabuleiro
    putStrLn "Escolha uma carta:"
    escolha <- getLine
    let tabuleiro2 = abreCarta tabuleiro escolha
    desenhaTabuleiro tabuleiro2
    putStrLn "Escolha uma carta:"
    escolha2 <- getLine
    let tabuleiro3 = abreCarta tabuleiro2 escolha2
    desenhaTabuleiro tabuleiro3
    -- let jogada2 = abreCarta (tabuleiro jogada1)
    -- if valor (carta jogada1) == valor (carta jogada2)
    -- then do
    --     putStrLn "Você acertou"
    --     rodada (tabuleiro jogada2)
    -- else do
    --     desenhaTabuleiro escondeCartas (tabuleiro jogada2)
    --     putStrLn "Você errou"

abreCarta :: [[Carta]] -> String -> [[Carta]]
abreCarta tabuleiro escolha = do
    let coordenada = pegaCoordenada escolha
    pegaCarta tabuleiro coordenada 