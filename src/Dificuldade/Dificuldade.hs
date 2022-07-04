{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use newtype instead of data" #-}
module Dificuldade.Dificuldade(
    Dificuldade
    ,geraDificuldade
    ,getNumeroCartas
    ,getTamanhoTabuleiro
    ) where

data Dificuldade = Dificuldade{
    tamanhoTabuleiro :: Int
} deriving Show

geraDificuldade :: Int -> Dificuldade
geraDificuldade n | n == 1 = Dificuldade {tamanhoTabuleiro=2}
                  | n == 2 = Dificuldade {tamanhoTabuleiro=4}
                  | n == 3 = Dificuldade {tamanhoTabuleiro=6}

getNumeroCartas :: Dificuldade -> Int
getNumeroCartas dificuldade = do
    let tamanhoTabuleiro = getTamanhoTabuleiro dificuldade
    tamanhoTabuleiro * tamanhoTabuleiro

getTamanhoTabuleiro :: Dificuldade -> Int
getTamanhoTabuleiro = tamanhoTabuleiro

