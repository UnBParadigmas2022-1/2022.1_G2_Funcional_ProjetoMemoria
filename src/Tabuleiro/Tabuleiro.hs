module Tabuleiro.Tabuleiro(
    geraTabuleiro,
    desenhaTabuleiro,
    pegaCoordenada,
    Coordenada,
    Jogada
    ) where

import Carta.Carta (
    Carta
    ,isFound
    ,isHidden
    ,getValue
    )
import Data.Char(
    toUpper,
    digitToInt,
    ord,
    chr
    )

data Coordenada = Coordenada Int Int

data Jogada = Jogada{
    carta  :: Carta,
    tabuleiro :: [[Carta]]
}

-- TODO ambaralhaCarta
embaralhaCarta :: [Carta] -> [Carta]
embaralhaCarta baralho = baralho

geraTabuleiro :: [Carta] -> [[Carta]]
geraTabuleiro baralho = do
    replicate 2 (embaralhaCarta baralho)

printCarta :: Carta -> IO ()
printCarta carta = do
    let c = carta :: Carta
    if not (isFound c)
    then do
        if isHidden c
        then putStr " *"
        else print (getValue c)
    else putStr "  "


printLinha :: Int -> [[Carta]] -> IO ()
printLinha n tabuleiro = do
    if n < length (head tabuleiro) - 1
    then do 
        putChar (numeroLetra n)
        mapM_ printCarta (tabuleiro !! n)
        putStrLn ""
        printLinha (n+1) tabuleiro
    else putStrLn ""

desenhaTabuleiro :: [[Carta]] -> IO ()
desenhaTabuleiro tabuleiro = do
    putStrLn "-------------------------"
    putStr "  " -- espaço do cabeçalho
    let tamanho = length (head tabuleiro)
    putStrLn . unwords . map show $ [1..tamanho]
    printLinha 0 tabuleiro

numeroLetra :: Int -> Char
numeroLetra numero = do
    let l = chr (numero + 65)
    toUpper l

letraNumero :: Char -> Int
letraNumero letra = do
    let l = toUpper letra
    ord l - 65

pegaCoordenada :: String -> Coordenada
pegaCoordenada entrada = do
    let x = letraNumero (head entrada)
    let y = digitToInt (entrada !! 1) - 1
    Coordenada x y

-- TODO viraCarta
-- viraCarta :: Tabuleiro -> Coordenada -> Jogada
-- viraCarta tabuleiro coordenada = Jogada {carta = carta, tabuleiro=tabuleiro}
