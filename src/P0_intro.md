
Pragmatic examples of Rank 2 
============================

Intro 
-----

Lamba Calculus (abstraction + application), forall quantification, and scoping are all very related. 

Talking points: what is the scope of `x` here?  what can applied to `x`?

```
λx. t
```

First class polymorphism
------------------------

Think about polymorphic functions being first class.  
Polymorphic functions being used in function arguments, in data constructors, etc. 

The exact positioning of where the polymorphic argument function is placed defines the rank. 

Formal definition of rank: (count left sides of `->` in the path to each `∀`,  TODO discuss during meeting)


Scoping
-------

Other way to look at higher rank:  limited type variable scope.
E.g. in TypeScript:

```TypeScript
declare function fn1<T> (f:(t:T)=> void): void 
declare function fn2(f: <T>(t:T)=> void): void 
```

`fn2` has rank 2.


forall. is a type level λ
------------------------

Thinking about type definitions as lambda expressions:

System-F:  Op Semantics of λ-calculus lifted to types 

* abstraction - `∀` abstraction 
* application - Type application (reduction rule specializing `∀` to any fixed type)

Note 1: Type application (simplarly to Haskell) is defined at value level (which is more powerful) so strictly speaking it is a little more than a lift of λ-calculus. 

Note 2: In mathematics, `Λ` (Happens to be the same symbol as upper case lambda) is sometimes used instead of `∀`.  Coincidence?  I think yes, a lucky one. 

Using closed lambda expressions (combinators) at type level creates higher rank expressions.



