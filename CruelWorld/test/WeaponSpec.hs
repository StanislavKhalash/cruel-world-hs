module WeaponSpec where

import Test.Hspec

import Weapon

spec :: Spec
spec = do
  describe "show" $ do
    it "should return the weapon's name" $ do
      show (weapon "Magical Sword" 100) `shouldBe` "Magical Sword"