module Pontuacao.Pontuacao( 
  verificaEscolhas
  ,getCartaByCoordenada
  )
where

import Carta.Carta (Carta)
import Tabuleiro.Tabuleiro
  ( Coordenada,
    pegaCoordenada,
    getX,
    getY,
  )

verificaEscolhas :: Int -> Int -> Int -> IO(Int)
verificaEscolhas valorEscolha valorEscolha2 pontuacaoTotal = do
  if valorEscolha == valorEscolha2
    then do
      pontuacaoTotal <- return(pontuacaoTotal+1)
      putStrLn "Você ganhou a rodada!"
      putStrLn ("Sua pontuacao atual eh: " ++ show pontuacaoTotal)
      return pontuacaoTotal
    else do
      putStrLn "Você perdeu a rodada! Tente novamente."
      putStrLn ("Sua pontuacao atual eh: " ++ show pontuacaoTotal)
      return pontuacaoTotal

getCartaByCoordenada :: [[Carta]] -> String -> Carta
getCartaByCoordenada tabuleiro escolha = do
  let coordenada = pegaCoordenada escolha
  let x = getX coordenada
  let y = getY coordenada
  tabuleiro !! x !! y
