module Carta.Carta(
    geraBaralho,
    Carta
    ) where

data Carta = Carta{
    valor  :: Int,
    estado :: Bool,
    encontrado :: Bool
} deriving Show

geraCarta :: Int -> Carta
geraCarta n = do
    Carta {valor = n, estado=False, encontrado=False}

geraBaralho :: Int -> [Carta] -> [Carta]
geraBaralho n baralho = do
    if n > 0
    then do
        geraBaralho (n-1) baralho++[geraCarta n]
    else baralho