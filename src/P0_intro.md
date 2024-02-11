
Pragmatic examples of Rank 2 
============================

Intro 
-----


Think about polymorphic functions being first class.  
Polymorphic functions being used in function arguments, in data constructors, etc. 

The exact positioning of this use defines the rank. 

Other way to look at it:  limited type variable scope

Formal definition of rank: (count left sides of `->` in the path to each `∀`,  TODO discuss during meeting)


Thinking about type definitions as lambda expressions:

PLT:  System-F   
OpSem of λ-calculus lifted to types 

* abstraction - ∀ abstraction 
* application - Type application (reduction rule specializing ∀ to any fixed type)

Closed lambda expressions (combinators) at type level. 



