{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE KindSignatures #-}
{-# LANGUAGE TypeApplications #-}


-- |
-- Qualifiers in constructors
-- GADTs can supersede existentials / higher rank

module P6_Constr where
import Data.Typeable


-- equivalent to forall
-- x is locally scoped
data HList where
  HCons :: Typeable x => x -> HList -> HList
  HNil  :: HList

infixr 5 -:
(-:) :: forall x . Typeable x => x -> HList -> HList 
(-:) = HCons 


tst :: HList  
tst = "A" -: (1 :: Int) -: HNil


-- moral equivalent requires extension
data HList' where 
  (:-) :: forall x . Typeable x => x -> HList' -> HList'
  HNil' :: HList' 

infixr 5 :-

tst' :: HList' 
tst' = "A" :- (1 :: Int) :- HNil'


testItIsRank2 :: (forall x . Typeable x => x -> a -> a) -> ()
testItIsRank2 x = undefined

tst1 = testItIsRank2 (:-)
tst2 = testItIsRank2 (-:)