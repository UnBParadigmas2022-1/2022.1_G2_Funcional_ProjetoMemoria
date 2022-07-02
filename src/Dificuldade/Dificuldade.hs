module Dificuldade.Dificuldade(
    geraDificuldade,
    Dificuldade,
    getNumeroCartas,
    getAltura,
    getLargura
    ) where

data Dificuldade = Dificuldade{
    altura :: Int,
    largura :: Int,
    tempoSegundos :: Int
} deriving Show

geraDificuldade :: Int -> Dificuldade
geraDificuldade n | n == 1 = Dificuldade {altura=2, largura=4, tempoSegundos = 2}
                  | n == 2 = Dificuldade {altura=4, largura=4, tempoSegundos = 2}
                  | n == 3 = Dificuldade {altura=4, largura=6, tempoSegundos = 2}
                  | otherwise = Dificuldade {altura=4, largura=6, tempoSegundos = 1}

getNumeroCartas :: Dificuldade -> Int
getNumeroCartas dificuldade = do (getAltura dificuldade) * (getLargura dificuldade)

getLargura :: Dificuldade -> Int
getLargura = largura

getAltura :: Dificuldade -> Int
getAltura = altura
