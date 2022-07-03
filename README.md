# 2022.1_G2_Funcional_ProjetoMemoria
# Projeto Memória

**Disciplina**: FGA0210 - PARADIGMAS DE PROGRAMAÇÃO - T01 <br>
**Nro do Grupo**: 02<br>
**Paradigma**: Funcional<br>

## Alunos
|Matrícula | Aluno |
| -- | -- |
| 180119818 | [Felipe Boccardi Silva Agustini](http://github.com/fealps) | 
| 180052845 | [Gabriela da Gama Pivetta](http://github.com/gabrielapivetta) | 
| 180017659 | [Giovana Vitor Dionisio Santana](http://github.com/giovanadionisio) | 
| 170011267 | [Giovanna Borges Bottino](http://github.com/giovannabbottino) | 
| 180017870 | [Giulia Lobo Barros](http://github.com/Giuulob89) | 
| 170144488 | [Henrique Amorim Costa Melo](http://github.com/henriqueamorim20) | 
| 180018574 | [Hérya Rodrigues Alcantara](http://github.com/hryds) | 
| 180025601 | [Murilo Gomes de Souza](http://github.com/murilogds)	| 

## Sobre 
Jogo da memória desenvolvido com Haskell e aplicando o paradigma funcional. Possui Funções puras, Imutabilidade, Transparência referencial e Funções de alta ordem como  filter, map e reduce.

## Screenshots
<figure>
  <img src="./src/imagens/menu.png" alt="Minha Figura">
  <figcaption>Menu</figcaption>
</figure><br><br>
<figure>
  <img src="./src/imagens/fim_jogo.png" alt="Minha Figura">
  <figcaption>Fim do Jogo</figcaption>
</figure>

## Instalação 
**Linguagens**: Haskell<br>
**Tecnologias**: Haskell, Random, Stack e GHC<br>
> Link para instalação do stack: https://docs.haskellstack.org/en/stable/install_and_upgrade/

Para rodar o Projeto do Jogo da Memória, é necessário seguir os passos abaixo:

1. Entrar na pasta correspodente ao repositório
```sh
cd 2022.1_G2_Funcional_ProjetoMemoria/src
```
2. Instalar o random
```sh
stack install random
```
3. Iniciar o GHC com o stack
```sh
stack ghci
```
4. Compilar
```sh
:load Main
```
5. Rodar Jogo
```sh
main
```

## Uso 
1. Depois que o projeto começar a rodar, irá aparecer o menu indicando as instruções para iniciar o jogo:<br><br>
<figure>
  <img src="./src/imagens/menu.png" alt="Minha Figura">
  <figcaption>Menu</figcaption>
</figure><br><br>
2. É possível escolher a opção **1**, a qual iniciará o jogo e mostrará novas instruções para identificação do jogador (Após o primeiro jogador ser identificado é possível inserir mais um jogador no jogo, porém essa é uma ação opcional) ou a opção **2**, a qual irá finalizar a aplicação:<br><br>
<figure>
  <img src="./src/imagens/identificacao_jogadores.png" alt="Minha Figura">
  <figcaption>Identificação dos jogadores</figcaption>
</figure><br><br>
<figure>
  <img src="./src/imagens/saindo.png" alt="Minha Figura">
  <figcaption>Saída</figcaption>
</figure><br><br>
3. Depois que todos os jogadores são identificados, são mostrados os níveis de dificuldade do jogo (Neste momento também é possível sair do jogo):<br><br>
<figure>
  <img src="./src/imagens/niveis_dificuldade.png" alt="Minha Figura">
  <figcaption>Dificuldades</figcaption>
</figure><br><br>
4. Após escolher um nível de dificuldade, o jogo de fato começa. O tabuleiro é representado por linhas de letras e colunas de números e cada carta (representada por um ' * ' ) é localizada pelo par de uma letra com um número (e.g. A1, B2, B4). Em cada rodada (de cada jogador), o jogador escolhe duas cartas e pode ver seus valores. Quando elas são iguais, a pontuação do jogador aumenta em +1 e as cartas viram novamente, mas trocando seu carácter de ' * ' para ' _ '. Caso contrário, o tabuleiro volta a apresentar o carácter ' * ' no lugar das cartas escolhidas e a pontuação não muda:<br><br>
<figure>
  <img src="./src/imagens/primeira_rodada.png" alt="Minha Figura">
  <figcaption>Primeira Rodada (Tabuleiro Original sem nenhum acerto)</figcaption>
</figure><br><br>
<figure>
  <img src="./src/imagens/rodadas.png" alt="Minha Figura">
  <figcaption>Rodada sem acerto</figcaption>
</figure><br><br>
<figure>
  <img src="./src/imagens/acerto.png" alt="Minha Figura">
  <figcaption>Rodada com acerto</figcaption>
</figure><br><br>
5. Ao final do jogo, são mostradas informações como o número de pontos feitos pelo jogador vencedor e o nome dele:<br><br>
<figure>
  <img src="./src/imagens/fim_jogo.png" alt="Minha Figura">
  <figcaption>Fim do Jogo</figcaption>
</figure><br><br>

**Gif do fluxo completo:**<br>
![gif_funcional](https://user-images.githubusercontent.com/54070461/177043169-30a3b363-bae0-4d5c-ad74-b07ed9692bb9.gif)




## Vídeo
Adicione 1 ou mais vídeos com a execução do projeto.
Procure: 
(i) Introduzir o projeto;
(ii) Mostrar passo a passo o código, explicando-o, e deixando claro o que é de terceiros, e o que é contribuição real da equipe;
(iii) Apresentar particularidades do Paradigma, da Linguagem, e das Tecnologias, e
(iV) Apresentar lições aprendidas, contribuições, pendências, e ideias para trabalhos futuros.
OBS: TODOS DEVEM PARTICIPAR, CONFERINDO PONTOS DE VISTA.
TEMPO: +/- 15min

## Participações
Apresente, brevemente, como cada membro do grupo contribuiu para o projeto.
| Aluno | Contribuição | Significância da Contribuição para o Projeto (Excelente/Boa/Regular/Ruim/Nula) |
| ----- | ------------ | ------------------------------------------------------------------------------ |
| Felipe Boccardi Silva Agustini | Programação dos Fatos da Base de Conhecimento Lógica | Boa |
| Gabriela da Gama Pivetta |  |  |
| Giovana Vitor Dionisio Santana |  Programação dos Fatos da Base de Conhecimento Lógica | Boa |
| Giovanna Borges Bottino |  Programação dos Fatos da Base de Conhecimento Lógica | Boa |
| Giulia Lobo Barros |  Programação dos Fatos da Base de Conhecimento Lógica | Boa |
| Henrique Amorim Costa Melo |  Programação dos Fatos da Base de Conhecimento Lógica | Boa |
| Hérya Rodrigues Alcantara |  Programação dos Fatos da Base de Conhecimento Lógica | Boa |
| Murilo Gomes de Souza |  Programação dos Fatos da Base de Conhecimento Lógica | Boa |

## Outros 
Quaisquer outras informações sobre o projeto podem ser descritas aqui.
(i) Lições Aprendidas;
(ii) Percepções;
(iii) Contribuições e Fragilidades, e
(iV) Trabalhos Futuros.

## Fontes
- Videoaulas e materiais de estudo disponibilizados pela professora Milene Serrano.
