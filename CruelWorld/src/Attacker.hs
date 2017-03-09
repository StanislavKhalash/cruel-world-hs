module Attacker where

import Creature

class (Creature a) => Attacker a where
    damage :: a -> Int

dealDamage :: (Attacker a, Creature c) => a -> c -> c
dealDamage attacker = receiveDamage (damage attacker)

duel :: Attacker a => a -> a -> (a, a)
duel = duel' True
  where duel' isAttacking off def 
          | isAlive off && isAlive def = duel' (not isAttacking) (dealDamage off def) off
          | isAttacking = (off, def)
          | otherwise = (def, off)

