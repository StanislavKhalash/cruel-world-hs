module Creature where

class Creature a where
    name :: a -> String
    currentHp :: a -> Int
    maxHp :: a -> Int
    receiveDamage :: a -> Int -> a

isAlive :: Creature a => a -> Bool
isAlive x = currentHp x > 0