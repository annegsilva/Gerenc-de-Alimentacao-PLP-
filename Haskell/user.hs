module User where

type Username = String
type Password = String
type Nome = String
type Idade = Int
type Peso = Float
type Altura = Float
type Circunf = Float
type Quadril = Float
type Dieta = Int

type User = (Username, Password, Nome, Idade, Peso, Altura, Circunf, Quadril, Dieta)

-- Retorna o username do usuario
getUsername :: User -> String
getUsername (username,_,_,_,_,_,_,_,_) = username

-- Retorna o password do usuario
getPassword :: User -> String
getPassword (_,password,_,_,_,_,_,_,_) = password

-- Retorna o nome do usuario
getNome :: User -> String
getNome (_,_,nome,_,_,_,_,_,_) = nome

-- Retorna a idade do usuario
getIdade :: User -> Int
getIdade (_,_,_,idade,_,_,_,_,_) = idade

-- Retona o peso do usuario
getPeso :: User -> Float
getPeso (_,_,_,_,peso,_,_,_,_) = peso

-- Retorna a altura do usuario
getAltura :: User -> Float
getAltura (_,_,_,_,_,altura,_,_,_) = altura

-- Retorna a medida de circunferencia abdominal do usuario 
getCircunf :: User -> Float
getCircunf (_,_,_,_,_,_,circunf,_,_) = circunf

-- Retorna a medida do quadril do usuario
getQuadil :: User -> Float
getQuadil (_,_,_,_,_,_,_,quadril,_) = quadril

-- Retorna o tipo de dieta do usuario
getDieta :: User -> Int
getDieta (_,_,_,_,_,_,_,_,dieta) = dieta