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
    receiveDamage c dmg = Goblin _name c hpAfterDmg c _maxHp _damage c _weapon c
        where hpAfterDmg = max _currentHp-dmg 0

instance Attacker Goblin where
    damage = _damage

goblin :: String -> Int -> Int -> Goblin
goblin name maxHp damage = Goblin name maxHp maxHp damage Nothing