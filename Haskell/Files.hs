module Files where

import Control.Exception
import System.IO.Error
import System.IO
import User

readUser :: String -> IO User
readUser username = do
{catch (ler_arquivo) tratar_erro;}
 where
 ler_arquivo = do
 {
  readData <- readFile ("users/"++username++".txt")
  let user = ((read readData) :: User)
  let oi = 10
 }
 tratar_erro erro = if isDoesNotExistError erro
  then do
 {
  putStrLn("Usuario não existente!");
  return ("","","",0,0,0,0,0,0);
 }
 else ioError erro
 
saveUser :: User -> IO()
saveUser user = do
  outh <- openFile ( "users/" ++ getUsername user ++ ".txt") WriteMode
  hPrint outh user 
  hFlush outh
  hClose outh