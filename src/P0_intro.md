
Pragmatic examples of Rank 2 
============================

Intro 
-----

Lamba abstraction, forall quantification, and scoping are all very related. 

Talking points: what is the scope of x?  what x can be?

```
λx. t
```

First class polymorphism
------------------------

Think about polymorphic functions being first class.  
Polymorphic functions being used in function arguments, in data constructors, etc. 

The exact positioning of where the polymorphic argument is placed defines the rank. 

Formal definition of rank: (count left sides of `->` in the path to each `∀`,  TODO discuss during meeting)


Scoping
-------

Other way to look at higher rank:  limited type variable scope



forall. is a type level λ
------------------------

Thinking about type definitions as lambda expressions:

PLT:  System-F   
OpSem of λ-calculus lifted to types 

* abstraction - ∀ abstraction 
* application - Type application (reduction rule specializing ∀ to any fixed type)

Note 1: Type application (simplarly to Haskell) is defined at value level (which is more powerful) so strictly speaking it is a little more than a lift of λ-calculus. 

Note 2: In mathematics, Λ (Happens to be upper case lambda) is sometimes used instead of ∀.  Coincidence? 

Closed lambda expressions (combinators) at type level. 



