
Existentials:  Implementation type remains hidden,  usage side cannot access it. 


`∃` can be implemented using `∀` and continuations that have higher rank.

The idea is that the implementer defines some private implementation `∃X` and provides a set of combinations for using it (an API) and controls how the API is "escaped" by using higher rank with scoped `∀X`.  The implementation type cannot escape because `∀X` has local scope. 

Related to "code to interface not to implementation",  factory design pattern, etc. 


https://rpeszek.github.io/posts/2022-01-09-ts-types-part4.html#higher-rank-types

https://hackage.haskell.org/package/base-4.19.0.0/docs/Control-Monad-ST.html
https://hackage.haskell.org/package/base-4.19.0.0/docs/Data-STRef.html


(1) should we implement Factory pattern in Haskell?