module Carta.Carta
  ( geraBaralho,
    Carta,
    getValor,
    getIsEscondido,
    getIsEncontrado,
    atualizaBaralho,
    atualizaAchadoNoBaralho,
  )
where

data Carta = Carta
  { valor :: Int,
    escondido :: Bool,
    encontrado :: Bool
  }
  deriving (Show)

getValor :: Carta -> Int
getValor (Carta {valor = valor}) = valor

getIsEncontrado :: Carta -> Bool
getIsEncontrado (Carta {encontrado = encontrado}) = encontrado

getIsEscondido :: Carta -> Bool
getIsEscondido (Carta {escondido = escondido}) = escondido

viraCarta :: Carta -> Carta
viraCarta c = do
  geraCarta (getValor c) (not (getIsEscondido c)) (getIsEncontrado c) 

achaCarta :: Carta -> Carta
achaCarta c = do
  geraCarta (getValor c) (getIsEscondido c) (not (getIsEncontrado c))

geraCarta :: Int -> Bool -> Bool -> Carta
geraCarta valor escondido encontrado = do
  Carta {valor = valor, escondido = escondido, encontrado = encontrado}

geraBaralho :: Int -> [Carta] -> [Carta]
geraBaralho n baralho = do
  if n > 0
    then do
      geraBaralho (n -1) baralho ++ [geraCarta n True False]
    else baralho

atualizaBaralho :: Int -> Int -> [Carta] -> [Carta] -> [Carta]
atualizaBaralho y n baralho novo_baralho = do
  if n < length baralho
    then do
      if n == y
        then atualizaBaralho y (n + 1) baralho (novo_baralho ++ [viraCarta (baralho !! n)])
        else atualizaBaralho y (n + 1) baralho (novo_baralho ++ [baralho !! n])
    else novo_baralho

atualizaAchadoNoBaralho :: Int -> Int -> [Carta] -> [Carta] -> [Carta]
atualizaAchadoNoBaralho y n baralho novo_baralho = do
  if n < length baralho
    then do
      if n == y
        then atualizaAchadoNoBaralho y (n + 1) baralho (novo_baralho ++ [achaCarta (baralho !! n)])
        else atualizaAchadoNoBaralho y (n + 1) baralho (novo_baralho ++ [baralho !! n])
    else novo_baralho