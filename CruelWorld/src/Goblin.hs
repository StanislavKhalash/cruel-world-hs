module Goblin
    (
      Goblin
    , goblin
    ) where

import Creature

data Goblin = Goblin 
    { _name :: String
    , _currentHp :: Int
    , _maxHp :: Int
    , _damage :: Int
    }

instance Creature Goblin where
    name      = _name
    currentHp = _currentHp
    maxHp     = _maxHp
    damage    = _damage

goblin :: String -> Int -> Int -> Goblin
goblin name maxHp damage = Goblin name maxHp maxHp damage