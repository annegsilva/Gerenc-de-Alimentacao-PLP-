
module User where

-- Informacoes do gerais do usuario
type Username = String
type Password = String
type Nome = String
type Idade = Int
type Sexo = String
type Dieta = Int
--Informacoes Fisicas do Usuario
type Peso = Float
type Altura = Float
type Circunf = Float
type Quadril = Float
--Informacoes diarias do usuario
type Proteina = [Float]
type Carboidrato = [Float]
type Gordura = [Float]
type Pontos = [Float]
-- Informacoes armazenadas (como uma Heap, onde cada indice equivale a um tipo de medida salva)
type indices =[Float]
type User = (Username, Password, Nome, Idade, Sexo, Peso, Altura, Circunf, Quadril, Dieta)

-- Estrutura de Usuario

-- Retorna o username do usuario
getUsername :: User -> String
getUsername (username,_,_,_,_,_,_,_,_,_) = username

-- Retorna o password do usuario
getPassword :: User -> String
getPassword (_,password,_,_,_,_,_,_,_,_) = password

-- Retorna o nome do usuario
getNome :: User -> String
getNome (_,_,nome,_,_,_,_,_,_,_) = nome

-- Retorna a idade do usuario
getIdade :: User -> Int
getIdade (_,_,_,idade,_,_,_,_,_,_) = idade

-- Retorna o sexo do usuario
getSexo :: User -> String
getSexo (_,_,_,_,sexo,_,_,_,_,_) = sexo

-- Retona o peso do usuario
getPeso :: User -> Int -> Float
getPeso (_,_,_,_,_,peso,_,_,_,_) = peso

-- Retorna a altura do usuario
getAltura :: User -> Float
getAltura (_,_,_,_,_,_,altura,_,_,_) = altura

-- Retorna a medida de circunferencia abdominal do usuario 
getCircunf :: User -> Float
getCircunf (_,_,_,_,_,_,_,circunf,_,_) = circunf

-- Retorna a medida do quadril do usuario
getQuadil :: User -> Float
getQuadil (_,_,_,_,_,_,_,_,quadril,_) = quadril

-- Retorna o tipo de dieta do usuario
getDieta :: User -> Int
getDieta (_,_,_,_,_,_,_,_,_,dieta) = dieta

--Funcionalidade 2
--Metodo para avaliar a porcao de proteina da dieta tipo (1)

proteina_tipo1 :: User -> Float -> Int
