/**
map a function over a value with context

Expected function type: `(a -> b) -> f a -> f b`
Haskell `infixl 4`
*/

precedencegroup Left130 {
    associativity: left
}

infix operator <^> : ComparisonPrecedence

/**
apply a function with context to a value with context

Expected function type: `f (a -> b) -> f a -> f b`
Haskell `infixl 4`
*/
infix operator <*> : ComparisonPrecedence

/**
sequence actions, discarding right (value of the second argument)

Expected function type: `f a -> f b -> f a`
Haskell `infixl 4`
*/

precedencegroup Left140 {
    associativity: left
    higherThan: Left120
}

infix operator <* : Left140

/**
sequence actions, discarding left (value of the first argument)

Expected function type: `f a -> f b -> f b`
Haskell `infixl 4`
*/
infix operator *> : Left140

/**
an associative binary operation

Expected function type: `f a -> f a -> f a`
Haskell `infixl 3`
*/

precedencegroup Left120 {
    associativity: left
    higherThan: ComparisonPrecedence
}

infix operator <|> : Left120

/**
map a function over a value with context and flatten the result

Expected function type: `m a -> (a -> m b) -> m b`
Haskell `infixl 1`
*/

precedencegroup Left100 {
    associativity: left
    higherThan: AssignmentPrecedence
    lowerThan: LogicalConjunctionPrecedence
}

infix operator >>- : Left100

/**
map a function over a value with context and flatten the result

Expected function type: `(a -> m b) -> m a -> m b`
Haskell `infixr 1`
*/

precedencegroup Right100 {
    associativity: right
    higherThan: AssignmentPrecedence
    lowerThan: LogicalConjunctionPrecedence
}

infix operator -<< : Right100

/**
compose two functions that produce results in a context,
from left to right, returning a result in that context

Expected function type: `(a -> m b) -> (b -> m c) -> a -> m c`
Haskell `infixr 1`
*/
infix operator >-> : Right100

/**
compose two functions that produce results in a context,
from right to left, returning a result in that context

like `>->`, but with the arguments flipped

Expected function type: `(b -> m c) -> (a -> m b) -> a -> m c`
Haskell `infixr 1`
*/

infix operator <-< : Right100
