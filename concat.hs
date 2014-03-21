import System.Environment (getArgs)
import System.IO (hClose, hPutStr, openFile, IOMode(WriteMode))

concatFiles :: FilePath -> [FilePath] -> IO ()
concatFiles destination files = do
    handle <- openFile destination WriteMode
    mapM (writeToDestination handle) files
    hClose handle     
    where
        writeToDestination wHandle file = hPutStr wHandle =<< readFile file

main = 
    getArgs >>=
    \args -> concatFiles (last args) (init args)
