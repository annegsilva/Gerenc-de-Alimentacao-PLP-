module User where

-- Informacoes gerais do usuario
type Username = String
type Password = String
type Nome = String
type Idade = Int
type Sexo = String
--Informacoes Fisicas do Usuario
type Altura = Float
type Peso = [Float]
type Circunf = [Float]
type Quadril = [Float]
--Informacoes diarias do usuario
type Dieta = Int
type Proteina = [Float]
type Carboidrato = [Float]
type Gordura = [Float]
type Pontos = [Float]
-- Informacoes armazenadas (como uma Heap, onde cada indice equivale a um tipo de medida salva)
type IMC =[Float]
type RCQ =[Float]
type DataUpdate =[Float]

-- estrutura de acesso ao User
type User = (Username, Password, Nome, Idade, Sexo, Altura, Peso, Circunf, Quadril, Dieta, Proteina, Carboidrato, Gordura, Pontos, IMC, RCQ, DataUpdate)

-- Estrutura de Usuario

-- (1) Retorna o Username do usuario
getUsername :: User -> String
getUsername (username,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_) = username

-- (2) Retorna o Password do usuario
getPassword :: User -> String
getPassword (_,password,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_) = password

-- (3) Retorna o Nome do usuario
getNome :: User -> String
getNome (_,_,nome,_,_,_,_,_,_,_,_,_,_,_,_,_,_) = nome

-- (4) Retorna a Idade do usuario
getIdade :: User -> Int
getIdade (_,_,_,idade,_,_,_,_,_,_,_,_,_,_,_,_,_) = idade

-- (5) Retorna o Sexo do usuario
getSexo :: User -> String
getSexo (_,_,_,_,sexo,_,_,_,_,_,_,_,_,_,_,_,_) = sexo

-- (6) Retorna a Altura do usuario
getAltura :: User -> Float
getAltura (_,_,_,_,_,altura,_,_,_,_,_,_,_,_,_,_,_) = altura

-- (7) Retona a LISTA de Pesos do usuario
getPeso :: User -> [Float]
getPeso (_,_,_,_,_,_,peso,_,_,_,_,_,_,_,_,_,_) = peso

-- (8) Retorna a LISTA das medidas de Circunferencia Abdominal do usuario 
getCircunf :: User -> [Float]
getCircunf (_,_,_,_,_,_,_,circunf,_,_,_,_,_,_,_,_,_) = circunf

-- (9) Retorna a LISTA das medidas do Quadril do usuario
getQuadil :: User -> [Float]
getQuadil (_,_,_,_,_,_,_,_,quadril,_,_,_,_,_,_,_,_) = quadril

-- (10) Retorna o tipo de Dieta do usuario
getDieta :: User -> Int
getDieta (_,_,_,_,_,_,_,_,_,dieta,_,_,_,_,_,_,_) = dieta

-- (11) Retorna a LISTA dos valores das Proteinas do usuario
getProt :: User -> [Float]
getProt (_,_,_,_,_,_,_,_,_,_,proteinas,_,_,_,_,_,_) = proteinas

-- (12) Retorna a LISTA dos valores dos Carboidratos do usuario
getCarb :: User -> [Float]
getCarb (_,_,_,_,_,_,_,_,_,_,_,carboidratos,_,_,_,_,_) = carboidratos

-- (13) Retorna a LISTA dos valores das Gorduras do usuario
getFat :: User -> [Float]
getFat (_,_,_,_,_,_,_,_,_,_,_,_,gorduras,_,_,_,_) = gorduras

-- (14) Retorna a LISTA dos valores dos Pontos do usuario
getPontos :: User -> [Float]
getPontos (_,_,_,_,_,_,_,_,_,_,_,_,_,pontos,_,_,_) = pontos

-- (15) Retorna a LISTA dos valores IMC do usuario
getIMC :: User -> [Float]
getIMC (_,_,_,_,_,_,_,_,_,_,_,_,_,_,imc,_,_) = imc

-- (16) Retorna a LISTA dos valores RCQ do usuario
getRCQ :: User -> [Float]
getRCQ (_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,rcq,_) = rcq

-- (16) Retorna a LISTA dos valores RCQ do usuario
getDate :: User -> [Float]
getDate (_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,date) = date

----- Metodos Auxiliares Gerais -----

-- Retorna nova lista adicionada de novo valor no head de uma lista
-- Parametros: lista, valor = lista atualizada
addValor :: [Float] -> Float -> [Float]
addValor [] valor = [valor]
addValor (x:xs) valor = valor:(x:xs)  

-- Retorna o head (valor mais recente) de uma lista
--Parametros lista = head
getHead :: [Float] -> Float
getHead (x:xs) = x

----- Metodos para Funcionalidade 2 (avaliacoes de refeicoes) -----

--Calcula o valor de gramas consumidas ate o momento
--Parametros: lista de porcoes = valor acumulado de gramas
acumulaGramas :: [Float] -> Float
acumulaGramas [] = 0
acumulaGramas (x:xs) = x + acumulaGramas xs

-- Calcula limite de gramas para o resto das refeicoes
-- Parametros: gramas max, valor acumulado nas refeicoes
limiteGramas :: Float -> Float -> Float
limiteGramas max soma = max - soma

-- Avalia uma porcao de proteina de uma dieta tipo 1 e 2
-- Parametros: prot, pesoAtual, dieta = string de avaliacao
avalProteina :: Float -> Float -> Int-> String
avalProteina_1 prot pesoAtual dieta
	| prot >= (1.4 * pesoAtual)/5 && prot <= (2 * pesoAtual)/5 && dieta == 1 = "Sua refeição tem a quantidade: IDEAL DE PROTEÍNA!"
	| prot < (1.4 * pesoAtual)/5 && dieta == 1 = "Sua refeição tem a quantidade: MENOR QUE A IDEAL DE PROTEÍNA!"
	| prot >(2 * pesoAtual)/5 && dieta == 1 = "Sua refeição tem a quantidade: SUPERIOR QUE A NECESSÁRIA DE PROTEÍNA! \nLembre-se que o nosso corpo tem um limite máximo de absorção."
	| prot >= (0.8 * pesoAtual)/5 && prot <= (1.4 * pesoAtual)/5 && dieta == 2= "Sua refeição tem a quantidade: IDEAL DE PROTEÍNA!"
	| prot < (0.8 * pesoAtual)/5 && dieta == 2 = "Sua refeição tem a quantidade: MENOR QUE A IDEAL DE PROTEÍNA!"
	| prot >(1.4 * pesoAtual)/5 && dieta == 2 = "Sua refeição tem a quantidade: SUPERIOR QUE A NECESSÁRIA DE PROTEÍNA! \nLembre-se que o nosso corpo tem um limite máximo de absorção."

-- Avalia uma porcao de carboidratos de uma dieta tipo 1 e 2
-- Parametros: carb, dieta= string de avaliacao
avalCarboidrato :: Float -> Int -> String
avalCarboidrato carb dieta
	| (carb >= 25 && carb <= 80) && dieta == 1 = "Sua refeição tem a quantidade: IDEAL DE CARBOIDRATOS!"
	| carb < 25 && dieta == 1 ="Sua refeição tem a quantidade: MENOR QUE A IDEAL DE CARBOIDRATOS!"
	| carb > 80 && dieta == 1 =  "Sua refeição tem a quantidade: SUPERIOR QUE A NECESSÁRIA DE CARBOIDRATOS! \nLembre-se que um alto consumo de carboitrados pode engordar."
	| (carb >= 10 && carb <= 30) && dieta == 2 = "Sua refeição tem a quantidade: IDEAL DE CARBOIDRATOS!"
	| carb < 10 && dieta == 2 =" Sua refeição tem a quantidade: MENOR QUE A IDEAL DE CARBOIDRATOS!"
	| carb > 30 && dieta == 2 =  "Sua refeição tem a quantidade: SUPERIOR QUE A NECESSÁRIA DE CARBOIDRATOS! \nLembre-se que um alto consumo de carboitrados pode engordar."

-- Avalia uma porcao de gordura das dietas do tipo 1 e 2
-- Parametros: gord = string de avaliacao
avalGordura :: Float -> String
avalGordura gord
	| gord >= 5.6 && gord <= 16.8 = "Sua refeição tem a quantidade: IDEAL DE GORDURAS!"
	| gord < 5.6 ="Sua refeição tem a quantidade: MENOR QUE A IDEAL DE GORDURAS!"
	| gord > 16.8 =  "Sua refeição tem a quantidade: SUPERIOR QUE A NECESSÁRIA DE GORDURAS! \nLembre-se que um alto consumo de gorduras faz mal à saúde."

-- Avalia uma refeicao baseada em pontos da dieta tipo 3
-- Paramentros: pontos = string de avaliacao
avalPontos :: Int -> String
avalPontos pontos
	| pontos == 6 = "Sua refeição tem a quantidade: IDEAL DE PONTOS! (para 5 refeições diárias)"
	| pontos < 6 = "Sua refeição tem a quantidade: MENOR QUE A IDEAL DE PONTOS! \nLembre-se em consumir seus pontos de forma equilibrada."
	| pontos > 6 = "Sua refeição tem a quantidade: MAIOR QUE A IDEAL DE PONTOS! \nLembre-se em consumir seus pontos de forma equilibrada."
	
-- Calcula limite de gramas para consumo
-- Parametros: peso, lista de porcoes, dieta, porcao = string de avaliacao
-- dieta (1) massa (2) emagrescimento (3) pontos
-- porcao: (1) proteina (2) carboidrato (3) gordura
avalConsumo :: Float -> [Float] -> Int -> Int -> String
avalConsumo pesoAtual (x:xs) dieta porcao
	| dieta == 1 && porcao == 1 = "Tente consumir em média " ++ show((pesoAtual * 2) / 5) ++ " gramas de PROTEÍNA por refeição. \nSeu limite de PROTEÍNAS no dia é " ++ show(limiteGramas (pesoAtual * 2) (acumulaGramas xs)) ++ " gramas." 
	| dieta == 1 && porcao == 2 = "Tente consumir em média " ++ show(200 / 5) ++ " gramas de CARBOITRADOS por refeição. \nSeu limite de CARBOITRADOS no dia é " ++ show(limiteGramas 200 (acumulaGramas xs)) ++ " gramas."
	
	| dieta == 2 && porcao == 1 = "Tente consumir em média " ++ show((pesoAtual * 1.4) / 5) ++ " gramas de PROTEÍNA por refeição. \nSeu limite de PROTEÍNAS no dia é " ++ show(limiteGramas (pesoAtual * 1.4) (acumulaGramas xs)) ++ " gramas." 
	| dieta == 2 && porcao == 2 = "Tente consumir em média " ++ show(100 / 5) ++ " gramas de CARBOITRADOS por refeição. \nSeu limite de CARBOITRADOS no dia é " ++ show(limiteGramas 100 (acumulaGramas xs)) ++ " gramas."
	
	| (dieta == 1 || dieta == 2)  && porcao == 3 = "Tente consumir em média " ++ show(22.2 / 5) ++ " gramas de GORDURAS por refeição. \nSeu limite de GORDURAS no dia é " ++ show(limiteGramas 22.2 (acumulaGramas xs)) ++ " gramas." 
	| dieta == 3 = "Tente consumir em média 6 pontos por refeição. \nSeu limite de PONTOS no dia é " ++ show(limiteGramas 30 (acumulaGramas xs))


----- Metodos para Funcionalidade 3 (calculo de indices e relatorios) -----

-- Calcula o IMC de um usuario com o pesoAtual
-- Paramentros: pesoAtual, altura = IMC 
calculaIMC :: Float -> Float -> Float
calculaIMC pesoAtual altura = pesoAtual / (altura^2)

-- Calcula o RCQ de um usuario a partir das medidas atuais da cintura e quadril
-- Paramentros: cintura, quadril = RCQ 
calculaRCQ :: Float -> Float -> Float
calculaRCQ cintura quadril = cintura / quadril

-- Avalia um resultado de IMC
-- Parametros: imc = string de avaliacao
avalIMC :: Float -> String
avalIMC imc
	| imc < 17.0 = "MUITO ABAIXO DO PESO"
	| imc >= 17.0 && imc < 18.5 = "ABAIXO DO PESO"
	| imc >= 18.5 && imc < 24.5 = "PESO NORMAL"
	| imc >= 24.5 && imc < 30.0 = "ACIMA DO PESO"
	| imc >= 30.0 && imc < 35.0 = "OBESIDADE I"
	| imc >= 35.0 && imc < 40.0 = "OBESIDADE II (severa)"
	| imc >= 40.0 = "OBESIDADE III (mórbida)" 

-- Avalia um resulta de RCQ
-- Parametros: rcq, sexo = string de avaliacao
avalRCQ :: Float -> String -> String
avalRCQ rcq sexo
	| (rcq < 0.80 && sexo == "F") || (rcq < 0.95 && sexo == "M") = "BAIXO RISCO DE SAUDE"
	| (rcq >= 0.80 && rcq <= 0.85 && sexo == "F") || (rcq >= 0.95 && rcq <= 1.0 && sexo == "M") = "MODERADO RISCO DE SAUDE"
	| (rcq > 0.85 && sexo == "F") || (rcq > 1.0 && sexo == "M") = "ALTO RISCO DE SAUDE"

-- Gera relatorio de evolucao de indices do Usuario
-- Parametros: lista de datas, imc, rcq, sexo = relatorio de indices
relatorioIndices :: [String] -> [Float] -> [Float] -> String -> String
relatorioIndices [] [] [] sexo = "\n"
relatorioIndices (x:xs) (y:ys) (z:zs) sexo = "----- Seus índices da data " ++ x ++ " são -----\nIMC ...: " ++ show(y) ++ "\nAnálise: " ++ show(avalIMC y) ++ "\nRCQ....: " ++ show(z) ++ "\nAnálise: " ++ show(avalRCQ z sexo) ++ "\n\n" ++ (relatorioIndices xs ys zs sexo)
