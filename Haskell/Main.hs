module Main where
import User
import System.Process as SP


-- Transforma em array
-- Parametros: username, novoValor
--writeData :: String -> String -> IO()
--writeData username novoValor = do
--	vazio <- reading username "vazio"
--	aux <- reading username "datas"
--	let antigo = (read aux :: [String])
--	if (aux == vazio)
--		then do write username "datas" (novoValor++";")
--		else do write username "datas" "teste"
--	return()
	
--Parametros: username, nome do atributo, novoValor
--writeFloat :: String -> String -> String -> IO()
--writeFloat username atributo novoValor = do
--	aux <- reading username atributo
--	let lista = (read aux :: [Float])
--	if(lista == [])
--	then do write username atributo ("["++novoValor++"]")
--	else do
--		let float = (read novoValor :: Float)
--		listaAux <- float:lista
--		let novaLista = (read listaAux :: String)
--		write username atributo novaLista

-- Escreve em arquivo o atributo especifico de um User
-- Parametros: username, atributo a ser escrito, novo valor do atributo a ser escrito
write :: String -> String -> String ->  IO()
write username atributo novoValor = do
	let arquivo = username ++ "_" ++ atributo ++ ".txt"
	SP.system ("echo " ++ novoValor ++ "> " ++ arquivo)
	return() 

-- Lê de um arquivo os dados de um atributo de um user
--Parametros: username, nome do atriubuto = valor armazenado do atributo
reading :: String -> String -> IO String
reading username atributo = do
	leitura <- readFile (username ++ "_" ++ atributo ++ ".txt")
	return (leitura)
	
-- Exibe as opoces do menu principal
-- Parametros: flag = string de opcao
menuPrincipal :: String
menuPrincipal  = "----------  Bem Vindo ao Gerenciador de Alimentacao! ----------\n\n----- O QUE DESEJA FAZER ----- \n(1) Fazer Login \n(2) Realizar Cadastro \n(3) Sair \nDigite sua opção: "

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
	
	write username "proteinas" "[]"
	write username "carboidratos" "[]"
	write username "gorduras" "[]"
	write username "pontos" "[]"
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
	writeData username novaData
	
	putStrLn("\n----- Atualização Realizada com Sucesso! -----\n")	
	return()	

relatorioEvolucao :: String -> IO()
relatorioEvolucao username = do
	aux1 <- reading username "imc"
	aux2 <- reading username "rcq"
	aux3 <- reading username "datas"
	sexo <- reading username "sexo"
	
	let imc = (read aux1 :: [Float])
	let rcq = (read aux2 :: [Float])
	let datas = (read aux3 :: [String])
	putStrLn(relatorioIndices datas imc rcq sexo)
	
	return ()
	

runMenuUser :: String -> IO()
runMenuUser username = do
	opcao <- getLine
	if(opcao == "1")
		then do putStrLn("Not implemented YET")
	else if(opcao == "2")
		then do atualizaMedidas username
	else if (opcao == "3")
		then do relatorioEvolucao username
	else do runMenuPrincipal
	return()

runMenuPrincipal :: IO()
runMenuPrincipal = do
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
	putStrLn(menuPrincipal)
	runMenuPrincipal
