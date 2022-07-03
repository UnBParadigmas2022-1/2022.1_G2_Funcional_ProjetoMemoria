module Jogo.Jogo
  ( rodaJogo,
  )
where

import System.Random ( newStdGen )

import Carta.Carta
import Tabuleiro.Tabuleiro
import Dificuldade.Dificuldade
import Jogador.Jogador
import Pontuacao.Pontuacao

rodaJogo :: Int -> [Jogador] -> IO ()
rodaJogo n jogadores = do
    let dificuldade = geraDificuldade n
    let baralho = geraBaralho ((getNumeroCartas dificuldade) `div` 2) []
    gen <- newStdGen
    let tabuleiro = geraTabuleiro gen (getLargura dificuldade) (baralho ++ baralho)
    rodada tabuleiro jogadores 0

fimJogo :: [[Carta]] -> Jogador -> IO ()
fimJogo tabuleiro jogador = do
  putStrLn "Fim do jogo."
  putStrLn ("Você venceu " ++ (getNome (jogador)) ++ "!")

rodada :: [[Carta]] -> [Jogador] -> Int -> IO ()
rodada tabuleiro jogadores index = do
  let jogador = (jogadores !! index)

  let pontuacaoTotal = sum (map getPontuacao jogadores)
  let qtCartas = (length tabuleiro * length (tabuleiro !! 1) ) `div` 2
  if pontuacaoTotal >= qtCartas
    then fimJogo tabuleiro jogador
  else do
    putStrLn ("Sua vez : " ++ (getNome (jogador)))
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

    let novoIndex = (index+1)`mod` (length jogadores)
    pontuacao <- verificaEscolhas valorEscolha1 valorEscolha2 (getPontuacao jogador)
    if (getPontuacao jogador) == pontuacao
      then do
        putStrLn "Errou uma carta:"
        let tabuleiro4 = abreCarta tabuleiro3 escolha
        let tabuleiro5 = abreCarta tabuleiro4 escolha2

        rodada tabuleiro5 jogadores ((index+1)`mod` 2)
    else do
      let tabuleiro4 = cartaAchada tabuleiro3 escolha
      let tabuleiro5 = cartaAchada tabuleiro4 escolha2

      let jogador2 = geraJogador (getNome jogador) (getNum jogador) pontuacao


      if index < novoIndex
      then do
        let novos_jogadores = [jogador2] ++ [(jogadores !! novoIndex)]
        rodada tabuleiro5 novos_jogadores index
      else if (length jogadores) > 1
        then do
          let novos_jogadores =  [(jogadores !! novoIndex)] ++ [jogador2]
          rodada tabuleiro5 novos_jogadores index
      else do
        rodada tabuleiro5 [jogador2] index

abreCarta :: [[Carta]] -> String -> [[Carta]]
abreCarta tabuleiro escolha = do
  let coordenada = pegaCoordenada escolha
  pegaCarta tabuleiro coordenada

cartaAchada :: [[Carta]] -> String -> [[Carta]]
cartaAchada tabuleiro escolha = do
  let coordenada = pegaCoordenada escolha
  achaCartaNoTabuleiro tabuleiro coordenada

