import User
import Files

main :: IO()
main = do
 putStrLn("-----  Bem Vindo ao Gerenciador de Alimentacao! -----")

 putStrLn("O QUE DESEJA FAZER: ")
 putStrLn("(1) Fazer Login")
 putStrLn("(2) Realizar Cadastro")
 putStrLn("(3) Sair")
 putStr("Digite sua opcao: ")

 entrada <- getLine
 user <- readUser entrada
 putStrLn(show user)

 if(entrada == "1") then do
  putStrLn("Username: ")
 else if (entrada == "2") then do
  putStrLn("digitei 2")
 else if (entrada == "3") then do
  putStrLn("digitei 3")
 else 
  putStrLn("entrada invalida")
