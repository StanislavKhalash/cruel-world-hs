module GoblinSpec where

import Test.Hspec

import Attacker
import Creature
import Goblin
import qualified Weapon

spec :: Spec
spec = do
  describe "Goblin" $ do
    describe "goblin" $ do
      it "should be initially alive" $ do
        let goblin' = goblin "Makarax Hagglebub" 100 15
        isAlive goblin' `shouldBe` True

    describe "armedGoblin" $ do
      it "should be initially alive" $ do
        let sword = Weapon.weapon "MagicalSword" 50
        let goblin' = armedGoblin "Makarax Hagglebub" 100 15 sword
        isAlive goblin' `shouldBe` True

      it "should have amplified damage" $ do
        let sword = Weapon.weapon "MagicalSword" 50
        let goblin' = armedGoblin "Makarax Hagglebub" 100 15 sword
        damage goblin' `shouldBe` 65
        
    describe "receiveDamage" $ do
      it "should reduce currentHp" $ do
        let goblin' = goblin "Makarax Hagglebub" 100 15
        currentHp (receiveDamage 25 goblin') `shouldBe` 75

      it "should kill if damage is grater than currentHp" $ do
        let goblin' = goblin "Makarax Hagglebub" 100 15
        isAlive (receiveDamage 100 goblin') `shouldBe` False
        
      it "should not drop currentHp below zero" $ do
        let goblin' = goblin "Makarax Hagglebub" 100 15
        currentHp (receiveDamage 1000 goblin') `shouldBe` 0