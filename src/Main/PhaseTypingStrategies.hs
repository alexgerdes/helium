{-| Module      :  PhaseTypingStrategies
    License     :  GPL

    Maintainer  :  helium@cs.uu.nl
    Stability   :  experimental
    Portability :  portable
-}

module Main.PhaseTypingStrategies(phaseTypingStrategies) where

import Main.CompileUtils
import Lvm.Core.Expr (CoreDecl)
import StaticAnalysis.Directives.TS_Compile (readTypingStrategiesFromFile)
import qualified Data.Map as M
import Syntax.UHA_Syntax (Name)
import Top.Types (TpScheme)

phaseTypingStrategies :: String -> ImportEnvironment -> [(Name, TpScheme)] -> [Option] ->
                            IO (ImportEnvironment, [CoreDecl])
phaseTypingStrategies fullName combinedEnv typeSignatures options

   | DisableDirectives `elem` options = 
        return (removeTypingStrategies combinedEnv, [])

   | otherwise =
        let (path, baseName, _) = splitFilePath fullName
            fullNameNoExt       = combinePathAndFile path baseName            
        in do enterNewPhase "Type inference directives" options
              (typingStrategies, typingStrategiesDecls) <-
                 readTypingStrategiesFromFile options (fullNameNoExt ++ ".type")        
                            (addToTypeEnvironment (M.fromList typeSignatures) combinedEnv)
              return 
                 ( addTypingStrategies typingStrategies combinedEnv
                 , typingStrategiesDecls
                 )              
