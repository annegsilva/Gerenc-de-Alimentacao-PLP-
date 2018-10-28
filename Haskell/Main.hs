module Main where
import User
import Files

cabecalho :: String
cabecalho = "By:\nAnne Gabriele\nGabryelle Soares\nLarissa Amorim\nLeonardo Lima\nNathalya Raissa"

-- Exibe as opoces do menu principal
menuPrincipal :: String
menuPrincipal  = "--------------- Bem Vindo ao Gerenciador de Alimentacao! --------------\n \n\n----------------- Você Está no Menu Principal -----------------\n\n \n----- O QUE DESEJA FAZER ----- \n(1) Fazer Login \n(2) Realizar Cadastro \n(3) Sair \nDigite sua opção: "

-- Exibe as opoces do menu de UserLogado
menuUser :: String
menuUser = "\n\n------------------ Você Está no Menu do Usuário ------------------\n\n \n----- O QUE DESEJA FAZER ----- \n(1) Inserir Refeição \n(2) Atualizar Medidas \n(3) Relatorio de Evolução \n(4) Voltar ao Menu Principal \nDigite sua opção: "

logarUser :: IO User
logarUser = do
	putStrLn("--------------- Iniciando Acesso -----------------")
	putStr("Username..........: ")
	username <- getLine
	putStr("Password..........: ")
	password <- getLine
	userLogado <- login username password
	return (userLogado)
	
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
		
	putStr("Altura........(m): ")
	altura <- getLine
	
	putStr("Peso..........(kg): ")
	peso <- getLine
	
	putStr("Cintura.......(m): ")
	cintura <- getLine
	
	putStr("Quadril.......(m): ")
	quadril <- getLine
	
	putStr("\n----- Cadastro Realizado com Sucesso! -----\n")
	putStrLn("(1) Ganho de Massa Muscular")
	putStrLn("(2) Emagrecimento")
	putStrLn("(3) Dieta dos Pontos")
	putStr("Digite sua opção: ")
	dieta <- getLine
	register username password sexo (read altura) (read peso) (read cintura) (read quadril) (read dieta)
	putStrLn("\n----- Cadastro Realizado com Sucesso! -----\n")	
	return()	

-- Metodo que atualiza as novas medidas fornecidas por um usario já cadastrado 
-- Parametros: username

atualizaMedidas :: User -> IO()
atualizaMedidas user = do
	putStrLn("\n------ Informe Suas Novas Medidas ------\n")
	putStr("Peso..........(kg): ")
	peso <- getLine
	let novoPeso = (read peso :: Float)
	let a = setPeso novoPeso user :: User
	
	putStr("Cintura.......(m): ")
	cintura <- getLine
	let novaCintura = (read cintura :: Float)
	let b = setCircunf novaCintura a :: User
	
	putStr("Quadril.......(m): ")
	quadril <- getLine
	let novoQuadril = (read quadril :: Float)
	let c = setQuadril novoQuadril b :: User
	
	putStr("Data....(dd/mm/aa): ")
	date <- getLine
	let novaData = (read date :: String)
	let d = setDataUpdate (date:(getDate c)) c :: User
	
	let novoIMC = calculaIMC (getPeso d) (getAltura d)
	putStrLn(show (getPeso d))
	putStrLn(show (getAltura d))
	let novoRCQ = calculaRCQ (getCircunf d) (getQuadril d)
	let e = setIMC (novoIMC:(getIMC d)) d :: User
	let f = setRCQ (novoRCQ:(getRCQ e)) e :: User
	salvarAlteracao f
	putStrLn("\n----- Atualização Realizada com Sucesso! -----\n")	
	return()	

relatorioEvolucao :: User -> IO()
relatorioEvolucao user = do
	let datas = getDate user
	let imc = getIMC user
	let rcq = getRCQ user
	let sexo = getSexo user
	putStrLn(relatorioIndices datas imc rcq sexo)	
	return ()

-- Paramentros: username
insereRefeicao1e2 :: User -> IO()
insereRefeicao1e2 user = do
	putStrLn("----- Informe o numero equivalente a refeição a ser inserida (1, 2, 3, 4, 5) -----")
	putStr("Número.......: ")
	numero <- getLine
	
	putStrLn("----------- Informe a quantidade dos seguintes nutrientes em gramas (g) ----------")
	
	putStr("Proteínas....: ")
	prot <- getLine
	let proteina = (read prot :: Float)
	let a = setProteina (proteina:(getProt user)) user :: User
	
	putStr("Carboitrados.: ")
	carb <- getLine
	let carboidrato = (read carb :: Float)
	let b = setCarbo (carboidrato:(getCarb a)) a :: User
	
	putStr("Gorduras.....: ")
	fat <- getLine
	let gordura = (read fat :: Float)
	let c = setGordura (gordura:(getFat b)) b :: User
	salvarAlteracao c
	putStrLn("\n ----- Refeição Registrada com Sucesso! ----- \n")
	
	putStrLn("\n -------- Avaliação da Porção de Proteínas -------- \n")
	putStrLn(avalProteina proteina (getPeso c) (getDieta c))
	putStrLn(avalConsumo (getPeso c) (getProt c) (getDieta c) 1)
	
	putStrLn("\n ------- Avaliação da Porção de Carboidratos ------ \n")
	putStrLn(avalCarboidrato carboidrato (getDieta c))
	putStrLn(avalConsumo (getPeso c) (getCarb c) (getDieta c) 2)
	
	putStrLn("\n --------- Avaliação da Porção de Gorduras -------- \n")
	putStrLn(avalGordura gordura)
	putStrLn(avalConsumo 0 (getFat c) (getDieta c) 3)
	return()

insereRefeicao3 :: User -> IO()
insereRefeicao3 user = do
	putStrLn("----- Informe a quantidade de PONTOS equivalente a refeição a ser inserida  -----")
	putStr("Pontos......: ")
	pontos <- getLine
	let novoPonto = (read pontos :: Float)
	let a = setPontos (novoPonto:(getPontos user)) user :: User 
	putStrLn(avalPontos novoPonto)
	putStrLn(avalConsumo 0 (getPontos a) 3 0 )
	return()

runMenuUser :: User -> IO()
runMenuUser user = do
	putStr(menuUser)
	opcao <- getLine
	if(opcao == "1") then do
		if(getDieta user == 1 || getDieta user == 2) then do
			insereRefeicao1e2 user
			runMenuUser user
		else do
			insereRefeicao3 user
			runMenuUser user
	else if(opcao == "2") then do
		atualizaMedidas user
		runMenuUser user
	else if (opcao == "3") then do
		relatorioEvolucao user
		runMenuUser user
	else do runMenuPrincipal
	return()

runMenuPrincipal :: IO()
runMenuPrincipal = do
	putStr(menuPrincipal)
	opcao <- getLine
	if(opcao == "1") 
		then do 
		userLogado <- logarUser
		if(userLogado == usuarioNulo) then do
			runMenuPrincipal
		else		
			runMenuUser userLogado
	
	else if(opcao == "2")
		then do 
		cadastro
		runMenuPrincipal	 
	
	else do putStrLn("Até a Próxima!")
	return()	

main :: IO()
main = do
	putStrLn(cabecalho)
	runMenuPrincipal
