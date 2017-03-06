module Attacker where

import Creature

class (Creature a) => Attacker a where
    damage :: a -> Int

dealDamage :: (Attacker a, Creature c) => a -> c -> c
dealDamage attacker creature = receiveDamage creature $ damage attacker