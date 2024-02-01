

```
t1 -> t2 -> t3 -- syntax sugar

t1 -> (t2 -> t3) -- binary tree 
```

Write this as a tree, in all paths to `forall` count how many times path is on the left of `->`

```                                    
forall b c. ((forall a. a -> b) -> c) -> (forall a. c -> a)
```