module Creature where

class Creature a where
    name :: a -> String
    currentHp :: a -> Int
    maxHp :: a -> Int
    damage :: a -> Int

isAlive :: Creature a => a -> Bool
isAlive x = currentHp x > 0