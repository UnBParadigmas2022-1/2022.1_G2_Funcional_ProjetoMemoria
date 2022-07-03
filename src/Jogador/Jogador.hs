module Jogador.Jogador (
    Jogador
    ,geraJogador
    ,getNome
    ,getNum
    ,getPontuacao) where

data Jogador = Jogador {
               nome :: String,
               num :: Int,
               pontuacao :: Int
               } deriving Show

getNome :: Jogador -> String
getNome = nome

getNum :: Jogador -> Int
getNum = num

getPontuacao :: Jogador -> Int
getPontuacao = pontuacao

geraJogador :: String -> Int -> Int -> Jogador
geraJogador nomeJogador n pontuacao = do
            Jogador{nome = nomeJogador, num = n, pontuacao=pontuacao}
