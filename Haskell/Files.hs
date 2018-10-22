module Files where

import Control.Exception
import System.IO.Error
import System.IO
import User

login :: String -> String -> IO User
login username password = do
 user <- readUser username
 if (user == ("","","",0,0,0,0,0,0)) then do
  putStrLn("Usuario inexistente!")
  return ("","","",0,0,0,0,0,0)
 else if (getPassword user == password) then do
  putStrLn("Logado com Sucesso!")
  return user
 else do
  putStrLn("Senha Incorreta!") 
  return ("","","",0,0,0,0,0,0)

logout :: User -> IO()
logout user = do
 saveUser user 
 putStrLn("Usuario deslogado!")

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
  return ("","","",0,0,0,0,0,0);
 }
 else ioError erro
 
saveUser :: User -> IO()
saveUser user = do
  outh <- openFile ( "users/" ++ getUsername user ++ ".txt") WriteMode
  hPrint outh user 
  hFlush outh
  hClose outh
