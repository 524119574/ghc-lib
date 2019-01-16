
import System.Directory
import System.Process.Extra


main :: IO ()
main = do
    system_ "git clone git://git.haskell.org/ghc.git --recursive" -- --recurse-submodules=libraries/Cabal"
    withCurrentDirectory "ghc-lib-gen" $ system_ "cabal run ../ghc"
    withCurrentDirectory "ghc" $ system_ "cabal build lib:ghc-lib --ghc-option=-O0"
