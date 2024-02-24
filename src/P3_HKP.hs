{-# LANGUAGE GADTs #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE DeriveFunctor #-}
{-# LANGUAGE ScopedTypeVariables #-}

{-# LANGUAGE RankNTypes #-}


-- | 
-- Higher Kinded Polymorphism with Natural Transformations
-- Polymorphic use of type construtors and HKD

module P3_HKP where

import Data.Map (Map)
import Data.Fix (Fix(..))
import Data.Functor.Foldable





-- (1) simple HKD example 

data HkdExample f  = MkHkdExample {
    intField :: f Int 
    , stringField :: f String
 }

-- 2-category map of sort
hoistMyHkd :: (forall a . f a -> g a) -> HkdExample f -> HkdExample g 
hoistMyHkd fxn (MkHkdExample x y) = MkHkdExample (fxn x) (fxn y)



-- (2) Look at 
-- hoist :: (Recursive s, Corecursive t) => (forall a. Base s a -> Base t a) -> s -> t
-- traverse, cotraverse, Medler recursion schemes. ...
-- https://hackage.haskell.org/package/recursion-schemes-5.2.2.5/docs/Data-Functor-Foldable.html



-- (3) DYI language example with HKD feature

type TypeName = String
type FieldName = String

data ToyLangValueF f a where 
   VLitIntF :: Int -> ToyLangValueF f a 
   VLitStringF :: String -> ToyLangValueF f a 
   VObjectF :: TypeName -> Map FieldName a -> ToyLangValueF f a
   VHkdF :: f a -> ToyLangValueF f a

deriving instance Functor f => Functor (ToyLangValueF f)

newtype ToyLangValue f = MkValue {unValue :: Fix (ToyLangValueF f)}

hoistToyVal :: forall f g . Functor f
  => (forall a . f a -> g a) -> ToyLangValue f -> ToyLangValue g
hoistToyVal fxn (MkValue f) = MkValue $ cata alg f
  where
    alg :: ToyLangValueF f (Fix (ToyLangValueF g)) -> Fix (ToyLangValueF g)
    alg (VLitIntF x)    = Fix $ VLitIntF x
    alg (VLitStringF x) = Fix $ VLitStringF x
    alg (VObjectF nm x) = Fix $ VObjectF nm x
    alg (VHkdF x)       = Fix $ VHkdF y 
      where y :: g (Fix (ToyLangValueF g)) = fxn x

