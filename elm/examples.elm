module Examples exposing (..)

import String

x : String
x = if True then "hello" else "goodbye"

match : Bool
match = {x=1, y=2} == {x=1, y=2}

inc : number -> number
inc = \x -> x + 1
{- or -}
inc2 : number -> number
inc2 x = x + 1
{- or -}
inc3 : number -> number
inc3 = (+) 1

fib : number -> number'
fib n = case n of
            0 -> 1
            1 -> 1
            _ -> fib (n-1) + fib (n-2)


map : (a -> b) -> List a -> List b
map fn xs = case xs of
                [] -> []
                head :: tail -> (fn head) :: map fn tail

mapped : List number
mapped = map inc [1, 2, 3]

reduce : (a -> b -> a) -> a -> List b -> a
reduce fn accu xs =
    case xs of
        [] -> accu
        head :: tail -> (reduce fn (fn accu head) tail)

reduced : number
reduced = reduce (+) 0 [1, 2, 3, 4]

filter : (a -> Bool) -> List a -> List a
filter predicate xs =
    case xs of
        [] -> []
        head :: tail -> if (predicate head)
                        then head :: filter predicate tail
                        else filter predicate tail

even : Int -> Bool
even x = (x % 2) == 0

odd : Int -> Bool
odd x = not (even x)

filtered : List Int
filtered = filter even [1, 2, 3, 4]


eval : List String -> String
eval things = case things of
               [] -> ""
               ["surprise", x] -> String.concat [x, "!!!"]
               "concat" :: rest -> String.concat rest
               _ -> "no match"


twice : number -> number
twice = (*) 2

incAndDouble : number -> number
incAndDouble = inc >> twice

doubleAndInc : number -> number
doubleAndInc = inc << twice

type alias Point2D a = {a | x : Float, y : Float}

move : Float -> Float -> Point2D a -> Point2D a
move x y point = {point | x = (.x point) + x,
                          y = (.y point) + y}

moved : Point2D { name : String }
moved = move 10 20 {x=0,y=0,name="Jean Valjean"}
