module Dificuldade.Dificuldade(
    Dificuldade,
    geraDificuldade,
    getNumeroCartas,
    getTamanhoTabuleiro
    ) where

data Dificuldade = Dificuldade{
    tamanhoTabuleiro :: Int,
    tempoSegundos :: Int
} deriving Show

geraDificuldade :: Int -> Dificuldade
geraDificuldade n | n == 1 = Dificuldade {tamanhoTabuleiro=2, tempoSegundos = 2}
                  | n == 2 = Dificuldade {tamanhoTabuleiro=4, tempoSegundos = 2}
                  | n == 3 = Dificuldade {tamanhoTabuleiro=6, tempoSegundos = 2}

getNumeroCartas :: Dificuldade -> Int
getNumeroCartas dificuldade = do
    let tamanhoTabuleiro = getTamanhoTabuleiro dificuldade
    tamanhoTabuleiro * tamanhoTabuleiro

getTamanhoTabuleiro :: Dificuldade -> Int
getTamanhoTabuleiro = tamanhoTabuleiro

