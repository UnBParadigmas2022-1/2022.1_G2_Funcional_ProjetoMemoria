module Jogador.Jogador (Jogador, geraJogador) where

data Jogador = Jogador {
               nome :: String,
               num :: Int 
               } deriving Show

geraJogador :: String -> Int -> Jogador
geraJogador nomeJogador n = do
            Jogador{nome = nomeJogador, num = n}
