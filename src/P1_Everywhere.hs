{-# LANGUAGE RankNTypes #-}


module P1_Everywhere where

import Control.Lens

-- (0) try removing RankN
-- (1) try removing x
-- (3) note scoping (where is "f")
-- (4) demonstrate rank 2 and first class poly (replace Traversal' with is def)
fn :: Traversal' String String -> String
fn x = undefined

{-
You are using rank 2 a lot, I am sure.  
E.g.  you are passing these around:


type Traversal s t a b = forall f. Applicative f => (a -> f b) -> s -> f t 
type Lens s t a b = forall f. Functor f => (a -> f b) -> s -> f t
type Prism s t a b = forall p f. (Choice p, Applicative f) => p a (f b) -> p s (f t) 

Vinyl, SOP, Servant, recursion-schemes ...
-}


-- Fun Exercise:  Define Lens by its composable setter/getter semantics and consider the above definition as a theorem. 
-- what programs are the proofs?  You need RankN to write these. 

-- (5) try removing RankN
comp :: Lens' s a -> Lens' a b -> Lens' s b 
comp = (.)

comp' :: Lens s t a b -> Lens a b c d -> Lens s t c d
comp' = (.)