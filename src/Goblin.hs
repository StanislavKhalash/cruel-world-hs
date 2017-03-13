module Goblin
    (
      Goblin
    , goblin
    , armedGoblin
    ) where

import Creature
import Attacker
import qualified Weapon

data Goblin = Goblin 
    { _name :: String
    , _currentHp :: Int
    , _maxHp :: Int
    , _damage :: Int
    , _weapon :: Maybe Weapon.Weapon
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
    damage goblin = case _weapon goblin of
      Just weapon -> _damage goblin + Weapon.damage weapon
      Nothing     -> _damage goblin

goblin :: String -> Int -> Int -> Goblin
goblin name maxHp damage = Goblin name maxHp maxHp damage Nothing

armedGoblin :: String -> Int -> Int -> Weapon.Weapon -> Goblin
armedGoblin name maxHp damage weapon = Goblin name maxHp maxHp damage (Just weapon)