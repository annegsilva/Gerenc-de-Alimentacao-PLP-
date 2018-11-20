module Main where
import User
import Files

cabecalho = "By:\nAnne Gabriele\nGabryelle Soares\nLarissa Amorim\nLeonardo Lima\nNathalya Raissa"
-- Busca um usuario na lista de usuarios cadastrados
-- Parametros: lista de usuarios, username, password = usuario
-- loginUser :: [User] -> String -> String -> User
-- loginUser [] _ _ = null
-- loginUser (x:xs) username password
-- |(getUsername x) != username && (getPassword x) != password = loginUser xs username password

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
  userLogado <- login username password
  menuUsuario userLogado
 else if (opcao_1 == "2") then do
  putStr("Username: ")
  username <- getLine
  putStr("Password: ")
  password <- getLine
  putStr("Sexo: ")
  sexo <- getLine
  putStr("Altura: ")
  altura <- getLine
  putStr("Peso: ")
  peso <- getLine
  putStr("Circunferencia Abdominal: ")
  circunf <- getLine
  putStr("Quadril: ")
  quadril <- getLine
  putStrLn("")
  putStrLn("Escolha um tipo de dieta: ")
  putStrLn("(1) Emagrecimento")
  putStrLn("(2) Ganho de Massa")
  putStrLn("(3) Dieta dos Pontos")
  putStr("Dieta selecionada: ")
  dieta <- getLine
  register username password sexo (read altura) (read peso) (read circunf) (read quadril) (read dieta)
 else
  putStrLn("Obrigado Até a próxima")


menuUsuario :: User -> IO()
menuUsuario user = do
 if(user /= usuarioNulo) then do
  putStrLn("\n----- O QUE DESEJA FAZER ----- ")
  putStrLn("(1) Inserir Refeição")
  putStrLn("(2) Atualizar Medidas")
  putStrLn("(3) Relatorio de Evolução")
  putStrLn("(4) Voltar ao Menu Principal")
  putStr("Digite sua opção: ")
  opcao_2 <- getLine
  if(opcao_2 == "1") then do
   putStrLn("Insira sua Refeição: ")
   let a = setPassword user :: User
   salvarAlteracao a
   menuUsuario user
  else if (opcao_2 == "2") then do
   putStrLn("Atualize suas medidas: ")
   menuUsuario user
  else if (opcao_2 == "3") then do
   putStrLn("Gerarando Relatório de Evolução")
   menuUsuario user
  else do
   main
 else 
  main