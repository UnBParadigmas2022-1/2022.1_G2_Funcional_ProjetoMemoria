module Tabuleiro.Tabuleiro
  ( geraTabuleiro,
    desenhaTabuleiro,
    pegaCoordenada,
    achaCartaNoTabuleiro,
    pegaCarta,
    Coordenada,
    getX,
    getY
  )
where
import System.Random (newStdGen, StdGen, randoms)
import Carta.Carta (
    Carta
    ,getIsEncontrado
    ,getIsEscondido
    ,getValor
    ,atualizaBaralho
    ,atualizaAchadoNoBaralho
    )
import Data.Char(
    toUpper
    ,digitToInt
    ,ord
    ,chr
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

embaralhaCarta :: StdGen -> [Carta] -> [Carta]
embaralhaCarta g xs = embaralha' (randoms g) xs

embaralha' :: [Int] -> [Carta] -> [Carta]
embaralha'  _ [] = []
embaralha' (i:is) xs = let (firsts, rest) = splitAt (i `mod` length xs) xs
                     in (head rest) : embaralha' is (firsts ++ tail rest)

geraTabuleiro :: StdGen -> Int -> [Carta] -> [[Carta]]
geraTabuleiro gen n baralho = do
    let embaralhado = embaralhaCarta gen baralho
    if length embaralhado == n
        then do [embaralhado]
    else
        [take n embaralhado] ++ geraTabuleiro gen n (drop n embaralhado)

printCarta :: Carta -> IO ()
printCarta carta = do
  let c = carta :: Carta
  if not (getIsEncontrado c)
    then do
      if getIsEscondido c
        then do
          putStr " *"
      else do
          putStr " "
          putStr . unwords . map show $ [getValor c]
  else putStr " -"

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

atualizaAchadoNoTabuleiro :: Int -> Int -> Int -> [[Carta]] -> [[Carta]] -> [[Carta]]
atualizaAchadoNoTabuleiro x y n tabuleiro novo_tabuleiro = do
  if n < length tabuleiro
    then do
      if n == x
        then do
          let baralho = atualizaAchadoNoBaralho y 0 (tabuleiro !! n) []
          atualizaAchadoNoTabuleiro x y (n + 1) tabuleiro (novo_tabuleiro ++ [baralho])
        else atualizaAchadoNoTabuleiro x y (n + 1) tabuleiro (novo_tabuleiro ++ [tabuleiro !! n])
    else novo_tabuleiro

achaCartaNoTabuleiro :: [[Carta]] -> Coordenada -> [[Carta]]
achaCartaNoTabuleiro tabuleiro coordenada = do
  atualizaAchadoNoTabuleiro (getX coordenada) (getY coordenada) 0 tabuleiro []
