module Login where
import System.Process as SP

-- Escreve em arquivo o atributo especifico de um User
-- Parametros: username, atributo a ser escrito, novo valor do atributo a ser escrito
write :: String -> String -> String ->  IO()
write username atributo novoValor = do
	let arquivo = username ++ "_" ++ atributo ++ ".txt"
	SP.system ("echo " ++ novoValor ++ "> " ++ arquivo)
	return()

-- Lê de um arquivo os dados de um atributo de um user
--Parametros: username, nome do atriubuto = valor armazenado do atributo
readString :: String -> String -> IO String
readString username atributo = do
	leitura <- readFile (username ++ "_" ++ atributo ++ ".txt")
	return (leitura)

--readFloat :: String -> String -> IO Float
--readFloat username atributo = do
--	aux <- readFile (username ++ "_" ++ atributo ++ ".txt")
--	let leitura = (read aux :: IO Float) 
--	return (leitura)

--Parametros: username, porcao, numero da refeicao 
inserePorcao :: String -> String -> String -> String -> IO()
inserePorcao username porcao numero novoValor = do
	let arquivo = username ++ "_" ++ porcao ++ "_" ++ numero ++ ".txt"
	SP.system ("echo " ++ novoValor ++ "> " ++ arquivo)
	return()
	
-- Busca elemento em lista
--
buscaElemento :: String -> [String] -> String
buscaElemento _ [] = "Nao Encontrado"
buscaElemento elemento (x:xs)
	|elemento == (show x) = elemento
	|otherwise = buscaElemento elemento xs

