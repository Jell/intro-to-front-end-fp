module Examples
import String

x = if True then "hello" else "goodbye"

match = {x=1, y=2} == {x=1, y=2}

inc = \x -> x + 1
{- or -}
inc2 x = x + 1
{- or -}
inc3 = (+) 1

fib n = case n of
            0 -> 1
            1 -> 1
            _ -> fib (n-1) + fib (n-2)


map fn xs = case xs of
                [] -> []
                head :: tail -> (fn head) :: map fn tail

mapped = map inc [1, 2, 3]

reduce fn accu xs =
    case xs of
        [] -> accu
        head :: tail -> (reduce fn (fn accu head) tail)

reduced = reduce (+) 0 [1, 2, 3, 4]

filter predicate xs =
    case xs of
        [] -> []
        head :: tail -> if (predicate head)
                        then head :: filter predicate tail
                        else filter predicate tail

even x = (x % 2) == 0
odd x = not (even x)

filtered = filter even [1, 2, 3, 4]


eval things = case things of
               [] -> ""
               ["surprise", x] -> String.concat [x, "!!!"]
               "concat" :: rest -> String.concat rest
               _ -> "no match"


twice = (*) 2
incAndDouble = inc >> twice
doubleAndInc = inc << twice
