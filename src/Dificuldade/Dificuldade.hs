module Dificuldade.Dificuldade(
    geraDificuldade,
    Dificuldade,
    getNumeroCartas
    ) where

data Dificuldade = Dificuldade{
    numeroCartas :: Int,
    tempoSegundos :: Int
} deriving Show

geraDificuldade :: Int -> Dificuldade
geraDificuldade n | n == 1 = Dificuldade {numeroCartas=16, tempoSegundos = 2}
                  | n == 2 = Dificuldade {numeroCartas=30, tempoSegundos = 2}
                  | n == 3 = Dificuldade {numeroCartas=48, tempoSegundos = 2}
                  | otherwise = Dificuldade {numeroCartas=48, tempoSegundos = 1}

getNumeroCartas :: Dificuldade -> Int
getNumeroCartas = numeroCartas
