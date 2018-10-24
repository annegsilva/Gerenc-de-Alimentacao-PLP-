module Main where
import User
import Files

----- Metodos de Interacao com o Usuario -----
-- Insere e avalia porcao de proteina das dietas do tipo 1 e 2
-- Parametros : User, dieta, proteina = aval
insereProt :: User -> Int -> String 

main :: IO()
main = do
putStrLn("-----  Bem Vindo ao Gerenciador de Alimentacao! -----")

 putStrLn("\n----- O QUE DESEJA FAZER ----- ")
 putStrLn("(1) Fazer Login")
 putStrLn("(2) Realizar Cadastro")
 putStrLn("(3) Sair")
 putStr("Digite sua opção: ")

 opcao_1 <- getLine
 --user <- readUser entrada
 --putStrLn(show user)

 if(opcao_1 == "1") then do
  putStr("Username: ")
  username <- getLine
  putStr("Password: ")
  password <- getLine
  putStrLn("\n----- O QUE DESEJA FAZER ----- ")
  putStrLn("(1) Inserir Refeição")
  putStrLn("(2) Atualizar Medidas")
  putStrLn("(3) Relatorio de Evolução")
  putStrLn("(4) Voltar ao Menu Principal")
  putStr("Digite sua opção: ")
  
  opcao_2 <- getLine
  if(opcao_2 == "1") then do
  if (getDieta == 1) then do
  putStrLn("Informe a quantidade dos seguintes nutrientes em gramas (g): "
  
  
  if(opcao_2 == "2") then do
  putStrLn("digitei 2")
  if(opcao_2 == "3") then do
  putStrLn("digitei 3")
  if(opcao_2 == "4") then do
  putStrLn("digitei 4")
   
   
 else if (entrada == "2") then do
  putStrLn("digitei 2")
 else if (entrada == "3") then do
  putStrLn("digitei 3")
 else 
putStrLn("entrada invalida")
