module Main where
import User

-- Busca um usuario na lista de usuarios cadastrados
-- Parametros: lista de usuarios, username, password = usuario
--loginUser :: [User] -> String -> String -> User
--loginUser [] _ _ = null
--loginUser (x:xs) username password
--|(getUsername x) != username && (getPassword x) != password = loginUser xs username password

-- Registra nas listras de nutrietes de um usario de dieta tipo 1 ou 2 uma feicao completa e retorna o aval
-- Parametros: User, proteina, carb, fat = aval

main :: IO()
main = do
  
  putStrLn("-----  Bem Vindo ao Gerenciador de Alimentacao! -----")
  putStrLn("----- O QUE DESEJA FAZER ----- ")
  putStrLn("(1) Fazer Login")
  putStrLn("(2) Realizar Cadastro")
  putStrLn("(3) Sair")
  putStr("Digite sua opção: ")
 
  opcao_1 <- getLine
  if(opcao_1 == "1") then do
  putStr("Username: ")
  username <- getLine
  putStr("Password: ")
  password <- getLine
  userLogado <- loginUser users username password
    if(user == null) then do putStrLn("Username ou Password Incorretos")
    else
      putStrLn("----- O QUE DESEJA FAZER ----- ")
      putStrLn("(1) Inserir Refeição")
      putStrLn("(2) Atualizar Medidas")
      putStrLn("(3) Relatorio de Evolução")
      putStrLn("(4) Voltar ao Menu Principal")
      putStr("Digite sua opção: ")
      opcao_2 <- getLine

      if(opcao_2 == 1) then do
        if(getDieta userLogado == 1 || getDieta userLogado == 2) then do
          putStrLn("----- Informe a quantidade dos seguintes nutrientes em gramas (g) -----")
          putStr("Proteinas...:")
          input_1 <- getLine
          let prot = (read input_1 :: Float)
          prot:(getProt user)
          putStrLn(avalProteina prot ((getPeso userLogado))

          putStr("Carboidratos:")
          input_2 <- getLine
          let carb = (read input_2 :: Float)
          carb:(getCarb user)
          
          putStr("Gorduras....:")
          input_3 <- getLine
          let fat = (read input_3 :: Float)
          fat:(getFat user)
          putStrLn()
