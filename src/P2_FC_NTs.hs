{-# LANGUAGE DeriveFunctor #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeApplications #-}
{-# OPTIONS_GHC -Wno-unused-matches #-}

{-# LANGUAGE RankNTypes #-}

-- | 
-- First Class Natural Transformations. 
-- Rank 2 is needed to pass polymorphic function as a parameter. 
--
-- Example usage: parameterize application by effect interpreter 

module P2_FC_NTs where

import System.Environment (lookupEnv)


main :: IO ()
main = do 
    env <- lookupEnv "mode" 

    mode <- case env of 
                Just "mode1" -> pure mode1
                Just "mode2" -> pure mode2  
                Just x -> fail $ "valid mode values are 'mode1' or 'mode2' got: " <> x
                Nothing -> fail "expecting mode env variable"
    
    case env of 
        Just "mode1" -> doMain mode1
        Just "mode2" -> doMain mode2
        Just x -> fail $ "valid mode values are 'mode1' or 'mode2' got: " <> x
        Nothing -> fail "expecting mode env variable"
    

-- (1) try removing forall in mode parameter
doMain :: (forall a . Eff a -> M a) -> IO ()
doMain mode = do 

    -- a little oversimplification here
    x <- mode @Int $ FakeProgramReturning 1
    y <- mode @String $ FakeProgramReturning "Test"

    -- (2)  try uncommenting to see scope restriction on 'a'        
    -- let z = id @a undefined   
    undefined

-- (4) discussion: design valid modes for a LLM chat app

mode1 :: forall a . Eff a -> M a 
mode1 = undefined 

mode2 :: forall a . Eff a -> M a 
mode2 = undefined

-- | Effect stack used by the app,  e.g. Polysemy 
data Eff a = FakeProgramReturning a deriving Functor

-- | morally a functor, typically used as a Transformer stack
type M a = IO (Either AppErr a) 

data AppErr = Blah 
