module Jogo.Jogo
  ( rodaJogo,
  )
where

import Carta.Carta (Carta, geraBaralho, getValue)
import Tabuleiro.Tabuleiro
  ( Coordenada,
    desenhaTabuleiro,
    geraTabuleiro,
    pegaCarta,
    pegaCoordenada,
  )
import Pontuacao.Pontuacao (verificaEscolhas, getValorCartaByCoordenada)

rodaJogo :: IO ()
rodaJogo = do
  let baralho = geraBaralho 3 []
  let tabuleiro = geraTabuleiro baralho
  rodada tabuleiro 0
  fimJogo tabuleiro

fimJogo :: [[Carta]] -> IO ()
fimJogo tabuleiro = putStrLn "Fim do jogo."

-- TODO rodada:
--
rodada :: [[Carta]] -> Int -> IO ()
rodada tabuleiro pontuacaoTotal = do
  desenhaTabuleiro tabuleiro
  putStrLn "Escolha uma carta:"
  escolha <- getLine
  let tabuleiro2 = abreCarta tabuleiro escolha
  valorEscolha1 <- getValorCartaByCoordenada tabuleiro2 escolha
  desenhaTabuleiro tabuleiro2
  putStrLn "Escolha uma carta:"
  escolha2 <- getLine
  let tabuleiro3 = abreCarta tabuleiro2 escolha2
  valorEscolha2 <- getValorCartaByCoordenada tabuleiro3 escolha2
  desenhaTabuleiro tabuleiro3
  pontuacaoTotal2 <- verificaEscolhas valorEscolha1 valorEscolha2 pontuacaoTotal
  rodada tabuleiro3 pontuacaoTotal2


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

