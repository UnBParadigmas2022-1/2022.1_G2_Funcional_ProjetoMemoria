module Jogo.Jogo
  ( rodaJogo,
  )
where

import System.Random ( newStdGen )

import Carta.Carta
import Tabuleiro.Tabuleiro
import Dificuldade.Dificuldade
import Jogador.Jogador
import Pontuacao.Pontuacao

rodaJogo :: Dificuldade -> [Jogador] -> IO ()
rodaJogo dificuldade jogadores = do
  gen <- newStdGen
  let tamanhoTabuleiro = getTamanhoTabuleiro dificuldade
  let numeroCartas = getNumeroCartas dificuldade `div` 2
  let baralho = geraBaralho numeroCartas []
  let tabuleiro = geraTabuleiro gen tamanhoTabuleiro (baralho ++ baralho)
  rodada tabuleiro jogadores 0

fimJogo :: [[Carta]] -> Jogador -> IO ()
fimJogo tabuleiro jogador = do
  putStrLn "Fim do jogo."
  putStrLn ("Você venceu " ++ (getNome (jogador)) ++ "!")

rodada :: [[Carta]] -> [Jogador] -> Int -> IO ()
rodada tabuleiro jogadores index = do
  let jogador = (jogadores !! index)

  let pontuacaoTotal = sum (map getPontuacao jogadores)
  let qtCartas = (length tabuleiro * length (tabuleiro !! 1) ) `div` 2
  if pontuacaoTotal >= qtCartas
    then do
      let pontuacaoJogador1 = getPontuacao (jogadores !! 0) 
      let pontuacaoJogador2 = getPontuacao (jogadores !! 1)
      if pontuacaoJogador1 > pontuacaoJogador2
        then do fimJogo tabuleiro (jogadores !! 0)
      else if pontuacaoJogador2 > pontuacaoJogador1
        then do fimJogo tabuleiro (jogadores !! 1)
      else do
        putStrLn "Fim do jogo. Empate!"
  else do
    putStrLn ("Sua vez : " ++ (getNome (jogador)))
    desenhaTabuleiro tabuleiro

    escolha <- getEscolha tabuleiro
    let coordenadaCartaEscolhida = snd escolha
    let valorCartaEscolhida = fst escolha
    let tabuleiro2 = pegaCarta tabuleiro coordenadaCartaEscolhida
    desenhaTabuleiro tabuleiro2

    escolha2 <- getEscolha tabuleiro2
    let coordenadaCartaEscolhida2 = snd escolha2
    let valorCartaEscolhida2 = fst escolha2
    let tabuleiro3 = pegaCarta tabuleiro2 coordenadaCartaEscolhida2
    desenhaTabuleiro tabuleiro3

    let novoIndex = (index+1)`mod` (length jogadores)
    pontuacao <- verificaEscolhas valorCartaEscolhida valorCartaEscolhida2 (getPontuacao jogador)
    if (getPontuacao jogador) == pontuacao
      then do
        putStrLn "Errou uma carta:"
        let tabuleiro4 = pegaCarta tabuleiro3 coordenadaCartaEscolhida
        let tabuleiro5 = pegaCarta tabuleiro4 coordenadaCartaEscolhida2

        rodada tabuleiro5 jogadores novoIndex
    else do
      let tabuleiro4 = achaCartaNoTabuleiro tabuleiro3 coordenadaCartaEscolhida
      let tabuleiro5 = achaCartaNoTabuleiro tabuleiro4 coordenadaCartaEscolhida2

      let jogador2 = geraJogador (getNome jogador) (getNum jogador) pontuacao


      if index < novoIndex
      then do
        let novos_jogadores = [jogador2] ++ [(jogadores !! novoIndex)]
        rodada tabuleiro5 novos_jogadores index
      else if (length jogadores) > 1
        then do
          let novos_jogadores =  [(jogadores !! novoIndex)] ++ [jogador2]
          rodada tabuleiro5 novos_jogadores index
      else do
        rodada tabuleiro5 [jogador2] index

getEscolha :: [[Carta]] -> IO (Int, Coordenada)
getEscolha tabuleiro = do
  putStrLn "--> Escolha uma carta (Exemplo: A1)"
  escolha <- getLine
  let coordenada = pegaCoordenada escolha
  let x = getX coordenada
  let y = getY coordenada
  let cartaSelecionada = getCartaByCoordenada tabuleiro escolha
  let isEncontrado = getIsEncontrado cartaSelecionada
  let isEscondido = getIsEscondido cartaSelecionada
  let valorCartaSelecionada = getValor cartaSelecionada
  print(isEncontrado)
  print(isEscondido)
  if(x < 0 || x >= length tabuleiro || y < 0 || y >= length tabuleiro) then do
    putStrLn "--> Escolha uma coordenada dentro do tabuleiro!!"
    getEscolha tabuleiro
  else if (isEncontrado) then do
    putStrLn "--> Escolha uma carta que ainda não foi encontrada!!"
    getEscolha tabuleiro
  else if (not isEscondido) then do
    putStrLn "--> Essa carta já foi escolhida!!"
    getEscolha tabuleiro
  else do return (valorCartaSelecionada, coordenada)
