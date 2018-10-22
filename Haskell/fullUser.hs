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
type Indices =[Float]

-- estrutura de acesso ao User
type User = (Username, Password, Nome, Idade, Sexo, Altura, Peso, Circunf, Quadril, Dieta, Proteina, Carboidrato, Gordura, Pontos, Indices)

-- Estrutura de Usuario

-- (1) Retorna o Username do usuario
getUsername :: User -> String
getUsername (username,_,_,_,_,_,_,_,_,_,_,_,_,_,_) = username

-- (2) Retorna o Password do usuario
getPassword :: User -> String
getPassword (_,password,_,_,_,_,_,_,_,_,_,_,_,_,_) = password

-- (3) Retorna o Nome do usuario
getNome :: User -> String
getNome (_,_,nome,_,_,_,_,_,_,_,_,_,_,_,_) = nome

-- (4) Retorna a Idade do usuario
getIdade :: User -> Int
getIdade (_,_,_,idade,_,_,_,_,_,_,_,_,_,_,_) = idade

-- (5) Retorna o Sexo do usuario
getSexo :: User -> String
getSexo (_,_,_,_,sexo,_,_,_,_,_,_,_,_,_,_) = sexo

-- (6) Retorna a Altura do usuario
getAltura :: User -> Float
getAltura (_,_,_,_,_,altura,_,_,_,_,_,_,_,_,_) = altura

-- (7) Retona a lista de Pesos do usuario
getPeso :: User -> [Float]
getPeso (_,_,_,_,_,_,peso,_,_,_,_,_,_,_,_) = peso

-- (8) Retorna a lista das medidas de Circunferencia Abdominal do usuario 
getCircunf :: User -> [Float]
getCircunf (_,_,_,_,_,_,_,circunf,_,_,_,_,_,_,_) = circunf

-- (9) Retorna a lista das medidas do Quadril do usuario
getQuadil :: User -> [Float]
getQuadil (_,_,_,_,_,_,_,_,quadril,_,_,_,_,_,_) = quadril

-- (10) Retorna o tipo de Dieta do usuario
getDieta :: User -> Int
getDieta (_,_,_,_,_,_,_,_,_,dieta,_,_,_,_,_) = dieta

-- (11) Retorna a lista dos valores das Proteinas do usuario
getProt :: User -> [Float]
getProt (_,_,_,_,_,_,_,_,proteina,_,_,_,_,_,_) = proteina

-- Retona o valor da medida mais recente do usuario
getMedidaAtual :: [Float] -> Float
getMedidaAtual (x:xs) = x
