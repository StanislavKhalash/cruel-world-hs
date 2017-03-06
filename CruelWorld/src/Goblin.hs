module Goblin
    (
      Goblin
    , goblin
    ) where

import Creature
import Attacker
import Weapon

data Goblin = Goblin 
    { _name :: String
    , _currentHp :: Int
    , _maxHp :: Int
    , _damage :: Int
    , _weapon :: Maybe Weapon
    }

instance Creature Goblin where
    name              = _name
    currentHp         = _currentHp
    maxHp             = _maxHp
    receiveDamage dmg goblin = Goblin name' currentHp' maxHp' damage' weapon'
        where name' = _name goblin
              currentHp' = max 0 (_currentHp goblin - dmg)
              maxHp' = _maxHp goblin
              damage' = _damage goblin
              weapon' = _weapon goblin

instance Attacker Goblin where
    damage = _damage

goblin :: String -> Int -> Int -> Goblin
goblin name maxHp damage = Goblin name maxHp maxHp damage Nothing