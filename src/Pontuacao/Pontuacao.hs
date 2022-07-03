module Pontuacao.Pontuacao( 
  verificaEscolhas
  ,getValorCartaByCoordenada
  )
where

import Carta.Carta (Carta, getValue)
import Tabuleiro.Tabuleiro
  ( Coordenada,
    pegaCoordenada,
    getX,
    getY,
  )

verificaEscolhas :: Int -> Int -> Int -> IO(Int)
verificaEscolhas valorEscolha valorEscolha2 pontuacaoTotal = do
  if show valorEscolha == show valorEscolha2
    then do
      pontuacaoTotal <- return(pontuacaoTotal+1)
      putStrLn "Você ganhou a rodada!"
      putStrLn ("Sua pontuacao atual eh: " ++ show pontuacaoTotal)
      return pontuacaoTotal
    else do
      putStrLn "Você perdeu a rodada! Tente novamente"
      putStrLn ("Sua pontuacao atual eh: " ++ show pontuacaoTotal)
      return pontuacaoTotal

getValorCartaByCoordenada :: [[Carta]] -> String -> IO (Int)
getValorCartaByCoordenada tabuleiro escolha = do
  let coordenada = pegaCoordenada escolha
  let x = getX coordenada
  let y = getY coordenada
  let linhaTabuleiro = tabuleiro !! x
  let celula = linhaTabuleiro !! y
  let valor = getValue celula
  return valor