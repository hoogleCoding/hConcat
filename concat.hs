-- Written by Florian Hug <florian.hug@gmail.com>
import Control.Applicative ((<*>))
import Data.Functor ((<$>))
import System.Environment (getArgs)
import System.IO (hClose, hPutStr, openFile, IOMode(WriteMode))

concatFiles :: FilePath -> [FilePath] -> IO ()
concatFiles destination files = do
    handle <- openFile destination WriteMode
    _ <- mapM (writeToDestination handle) files
    hClose handle     
    where
        writeToDestination wHandle file = hPutStr wHandle =<< readFile file
main :: IO()
main = getArgs >>= concatFiles <$> last <*> init
