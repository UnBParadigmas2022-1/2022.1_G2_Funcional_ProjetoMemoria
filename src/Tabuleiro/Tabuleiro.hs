module Tabuleiro.Tabuleiro
  ( geraTabuleiro,
    desenhaTabuleiro,
    pegaCoordenada,
    pegaCarta,
    Coordenada,
    getX,
    getY
  )
where

import Carta.Carta
  ( Carta,
    atualizaBaralho,
    getValue,
    isFound,
    isHidden,
  )
import Data.Binary.Put (putInt8)
import Data.Char
  ( chr,
    digitToInt,
    ord,
    toUpper,
  )

data Coordenada = Coordenada
  { x :: Int,
    y :: Int
  }
  deriving (Show)

getX :: Coordenada -> Int
getX = x

getY :: Coordenada -> Int
getY = y

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
        else do
          putStr " "
          putStr . unwords . map show $ [getValue c]
    else putStr "  "

printLinha :: Int -> [[Carta]] -> IO ()
printLinha n tabuleiro = do
  if n < length tabuleiro
    then do
      putChar (numeroLetra n)
      mapM_ printCarta (tabuleiro !! n)
      putStrLn ""
      printLinha (n + 1) tabuleiro
    else putStrLn ""

desenhaTabuleiro :: [[Carta]] -> IO ()
desenhaTabuleiro tabuleiro = do
  putStrLn "-------------------------"
  putStr "  " -- espaço do cabeçalho
  let tamanho = length (head tabuleiro)
  putStrLn . unwords . map show $ [1 .. tamanho]
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
  Coordenada {x = x, y = y}

atualizaTabuleiro :: Int -> Int -> Int -> [[Carta]] -> [[Carta]] -> [[Carta]]
atualizaTabuleiro x y n tabuleiro novo_tabuleiro = do
  if n < length tabuleiro
    then do
      if n == x
        then do
          let baralho = atualizaBaralho y 0 (tabuleiro !! n) []
          atualizaTabuleiro x y (n + 1) tabuleiro (novo_tabuleiro ++ [baralho])
        else atualizaTabuleiro x y (n + 1) tabuleiro (novo_tabuleiro ++ [tabuleiro !! n])
    else novo_tabuleiro

pegaCarta :: [[Carta]] -> Coordenada -> [[Carta]]
pegaCarta tabuleiro coordenada = do
  atualizaTabuleiro (getX coordenada) (getY coordenada) 0 tabuleiro []
