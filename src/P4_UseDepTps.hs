{-# LANGUAGE KindSignatures #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE StandaloneDeriving #-}

{-# LANGUAGE RankNTypes #-}



-- |
-- Use dependenlty typed code when working on loose types
-- CPS approach
-- 
-- Haskell is not very good about these and some of it requires rewrite rules
module P4_UseDepTps where



data Nat = Z | S Nat deriving Show

data SNat n where 
    SZ :: SNat Z
    SC :: SNat n -> SNat (S n)

deriving instance Show (SNat n)  

data Vect (n :: Nat) a where
     VNil :: Vect 'Z a
     VCons :: a -> Vect n a -> Vect ('S n) a
     
deriving instance Show a => Show (Vect n a)

infixr 5 -:
(-:) :: a -> Vect n a -> Vect ('S n) a
(-:) = VCons

data SomeVect a where
   SomeVect :: SNat s -> Vect s a -> SomeVect a

deriving instance Show a => Show (SomeVect a)

{-| CPS style reification -}
withSomeVect :: SomeVect a -> (forall n. SNat n -> Vect n a -> r) -> r
withSomeVect (SomeVect sn vec) f = f sn vec

listToSomeVect :: [a] -> SomeVect a
listToSomeVect [] = SomeVect SZ VNil
listToSomeVect (x : xs) 
      = case listToSomeVect xs of SomeVect n rr -> SomeVect (SC n) (x `VCons` rr) 

withList :: [a] -> (forall n. SNat n -> Vect n a -> r) -> r
withList a = withSomeVect (listToSomeVect a)



