module Files where

import System.IO
import User

readUser :: String -> IO User
readUser username = do
 readData <- readFile ( "users/" ++ username ++ ".txt")
 let user = read (readData) :: User
 return user

saveUser :: User -> IO()
saveUser user = do
 outh <- openFile ( "users/" ++ getUsername user ++ ".txt") WriteMode
 hPrint outh user 
 hFlush outh
 hClose outh