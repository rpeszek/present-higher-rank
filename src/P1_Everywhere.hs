{-# LANGUAGE RankNTypes #-}


module P1_Everywhere where

import Control.Lens

-- (1) try removing x
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