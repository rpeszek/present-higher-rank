{-# LANGUAGE RankNTypes #-}

module P6_Subsumption where

-- https://np.reddit.com/r/haskell/comments/ujpzx3/was_simplified_subsumption_worth_it_for_industry/

-- this code broke in ghc 9.0 it works again

f :: (forall a. (Show a, Eq a) => a -> String) -> String
f h = h True

g :: (forall a. (Eq a, Show a) => a -> String) -> String
g = f


-- however occasionally I still see need to spell out all params