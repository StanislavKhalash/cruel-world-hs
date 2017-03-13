module Creature where

class Creature a where
    name :: a -> String
    currentHp :: a -> Int
    maxHp :: a -> Int
    receiveDamage :: Int -> a -> a

isAlive :: Creature a => a -> Bool
isAlive x = currentHp x > 0

isDead :: Creature a => a -> Bool
isDead = not . isAlive