module Weapon
    (
      Weapon
    , weapon
    ) where

data Weapon = Weapon 
    { _name :: String
    , _damage :: Int
    }

instance Show Weapon where 
    show (Weapon name _) = name

weapon :: String -> Int -> Weapon
weapon name damage = Weapon name damage