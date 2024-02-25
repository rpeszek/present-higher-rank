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


-- equivalent to forall
-- x is locally scoped
data HList where
  HCons ::  x -> HList -> HList
  HNil  :: HList

infixr 5 -:
(-:) :: forall x . x -> HList -> HList 
(-:) = HCons 


tst :: HList  
tst = "A" -: (1 :: Int) -: HNil


-- moral equivalent requires extension
-- (1) comment RankN pragma to see compilation errors, GADTs supersede RankN in some sense only 
data HList' where 
  (:-) :: forall x . x -> HList' -> HList'
  HNil' :: HList' 

infixr 5 :-

tst' :: HList' 
tst' = "A" :- (1 :: Int) :- HNil'


testItIsRank2 :: (forall x . x -> a -> a) -> ()
testItIsRank2 x = undefined

tst1 = testItIsRank2 (:-)
tst2 = testItIsRank2 (-:)