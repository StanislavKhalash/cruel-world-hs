module Weapon
    (
      Weapon
    , weapon
    , damage
    ) where

data Weapon = Weapon 
    { _name :: String
    , _damage :: Int
    }

instance Show Weapon where 
    show (Weapon name _) = name

weapon :: String -> Int -> Weapon
weapon = Weapon

damage :: Weapon -> Int
damage = _damage