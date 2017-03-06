module Attacker where

import Creature

class (Creature a) => Attacker a where
    damage :: a -> Int

dealDamage :: (Attacker a, Creature c) => a -> c -> c
dealDamage attacker = receiveDamage (damage attacker)