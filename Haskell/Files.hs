module Files where

import Control.Exception
import System.IO.Error
import System.IO
import User

usuarioNulo :: User
usuarioNulo = ("","","",0,0,0,0,0,[],[],[],[],[],[],[])

login :: String -> String -> IO User
login username password = do
 user <- readUser username
 if (getPassword user == password) then do
  putStrLn("Logado com Sucesso!")
  return user
 else do
  putStrLn("Senha Incorreta!") 
  return usuarioNulo

register :: String -> String -> String -> Float -> Float -> Float -> Float -> Int -> IO()
register username password sexo altura peso circun quadril dieta = do 
 let user = (username,password,sexo,altura,peso,circun,quadril,dieta,[],[],[],[],[],[],[]) :: User
 saveUser user
 putStrLn("Usuario Salvo com Sucesso!")

salvarAlteracao :: User -> IO()
salvarAlteracao user = do
 saveUser user 

readUser :: String -> IO User
readUser username = do
{catch (ler_arquivo) tratar_erro;}
 where
 ler_arquivo = do
 {
  readData <- readFile ("users/"++username++".txt");
  return (read readData)
 }
 tratar_erro erro = if isDoesNotExistError erro
  then do
 {
  return usuarioNulo;
 }
 else ioError erro
 
saveUser :: User -> IO()
saveUser user = do
  outh <- openFile ( "users/" ++ getUsername user ++ ".txt") WriteMode
  hPrint outh user 
  hFlush outh
  hClose outh
