module Main where
import User
import Login

--Cria arquivos para dietas do tipo 1 e 2
--Paramentros: dieta
arquivosDieta1e2 :: String -> IO()
arquivosDieta1e2 username = do
	write username "prot_1" "0"
	write username "prot_2" "0"
	write username "prot_3" "0"
	write username "prot_4" "0"
	write username "prot_5" "0"
	write username "carb_1" "0"
	write username "carb_2" "0"
	write username "carb_3" "0"
	write username "carb_4" "0"
	write username "carb_5" "0"
	write username "fat_1" "0"
	write username "fat_2" "0"
	write username "fat_3" "0"
	write username "fat_4" "0"
	write username "fat_5" "0"
	return()

arquivosDieta3 :: String -> IO()
arquivosDieta3 username = do
	write username "pontos" "0"

-- Exibe as opoces do menu principal
menuPrincipal :: String
menuPrincipal  = "--------------- Bem Vindo ao Gerenciador de Alimentacao! --------------\n \n\n----------------- Você Está no Menu Principal -----------------\n\n \n----- O QUE DESEJA FAZER ----- \n(1) Fazer Login \n(2) Realizar Cadastro \n(3) Sair \nDigite sua opção: "

-- Exibe as opoces do menu de UserLogado
menuUser :: String
menuUser = "\n\n------------------ Você Está no Menu do Usuário ------------------\n\n \n----- O QUE DESEJA FAZER ----- \n(1) Inserir Refeição \n(2) Atualizar Medidas \n(3) Relatorio de Evolução \n(4) Voltar ao Menu Principal \nDigite sua opção:"

-- Metodo que exibe as opcoes e grava em arquivos os dados de um novo usuario
cadastro :: IO()
cadastro = do
	putStrLn("--------------- Iniciando Cadastro -----------------")
	putStrLn("\n----- Determine Seu Nome de Acesso e Sua Senha -----")
	putStr("Username..........: ")
	username <- getLine
	putStr("Password..........: ")
	password <- getLine
	putStrLn("\n----- Agora Nos Conte Mais Sobre Você -----")
	
	putStr("Sexo........(F)(M): ")
	sexo <- getLine
	write username "sexo" sexo
	
	putStr("Altura........(cm): ")
	altura <- getLine
	write username "altura" altura
	
	putStr("Peso..........(kg): ")
	peso <- getLine
	write username "peso" peso
	
	putStr("Cintura.......(cm): ")
	cintura <- getLine
	write username "cintura" cintura
	
	putStr("Quadril.......(cm): ")
	quadril <- getLine
	write username "quadril" quadril
	
	putStr("\n----- Cadastro Realizado com Sucesso! -----\n")
	putStrLn("(1) Ganho de Massa Muscular")
	putStrLn("(2) Emagrecimento")
	putStrLn("(3) Dieta dos Pontos")
	putStr("Digite sua opção: ")
	dieta <- getLine
	write username "dieta" dieta
	
	if(dieta == "1" || dieta == "2")
		then do arquivosDieta1e2 username
	else arquivosDieta3 username
	
	write username "datas" "[]"
	write username "imc" "[]"
	write username "rcq" "[]"
	
	putStrLn("\n----- Cadastro Realizado com Sucesso! -----\n")	
	return()	

-- Metodo que atualiza as novas medidas fornecidas por um usario já cadastrado 
-- Parametros: username
atualizaMedidas :: String -> IO()
atualizaMedidas username = do
	putStrLn("\n------ Informe Suas Novas Medidas ------\n")
	putStr("Peso..........(kg): ")
	peso <- getLine
	write username "peso" peso
	
	putStr("Cintura.......(cm): ")
	cintura <- getLine
	write username "cintura" cintura
	
	putStr("Quadril.......(cm): ")
	quadril <- getLine
	write username "quadril" quadril
	
	putStr("Data....(dd/mm/aa): ")
	novaData <- getLine
	write username "datas" novaData
	
	putStrLn("\n----- Atualização Realizada com Sucesso! -----\n")	
	return()	

relatorioEvolucao :: String -> IO()
relatorioEvolucao username = do
	aux1 <- readString username "imc"
	aux2 <- readString username "rcq"
	aux3 <- readString username "datas"
	sexo <- readString username "sexo"
	
	let imc = (read aux1 :: [Float])
	let rcq = (read aux2 :: [Float])
	let datas = (read aux3 :: [String])
	putStrLn(relatorioIndices datas imc rcq sexo)
	
	return ()

-- Paramentros: username
insereRefeicao1e2 :: String -> IO()
insereRefeicao1e2 username = do
	putStrLn("----- Informe o numero equivalente a refeição a ser inserida (1, 2, 3, 4, 5) -----")
	putStr("Número.......: ")
	numero <- getLine
	
	putStrLn("----------- Informe a quantidade dos seguintes nutrientes em gramas (g) ----------")
	
	putStr("Proteínas....: ")
	prot <- getLine
	inserePorcao username "prot" numero prot
	
	putStr("Carboitrados.: ")
	carb <- getLine
	inserePorcao username "carb" numero carb
	
	putStr("Gorduras.....: ")
	fat <- getLine
	inserePorcao username "fat" numero fat
	
	putStrLn(\n ----- Refeição Registrada com Sucesso! ----- \n"
	
runMenuUser :: String -> IO()
runMenuUser username = do
	putStr(menuUser)
	opcao <- getLine
	if(opcao == "1") then do
		insereRefeicao1e2 username
		runMenuUser username
	else if(opcao == "2") then do
		atualizaMedidas username
		runMenuUser username
	else if (opcao == "3") then do
		relatorioEvolucao username
		runMenuUser username
	else do runMenuPrincipal
	return()

runMenuPrincipal :: IO()
runMenuPrincipal = do
	putStr(menuPrincipal)
	opcao <- getLine
	let username = "anne"
	if(opcao == "1") 
		then do runMenuUser username 
	
	else if(opcao == "2")
		then do cadastro	
	
	else do putStrLn("Deu certo")
	return()	

main :: IO()
main = do
	runMenuPrincipal
