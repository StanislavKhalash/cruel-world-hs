module GoblinSpec where

import Test.Hspec
import Creature
import Goblin

spec :: Spec
spec = do
  describe "Goblin" $ do
    describe "goblin" $ do
      it "should be initially alive" $ do
        isAlive (goblin "Makarax Hagglebub" 100 15) `shouldBe` True
    describe "receiveDamage" $ do
      it "should reduce currentHp" $ do
        currentHp (receiveDamage 25 (goblin "Makarax Hagglebub" 100 15)) `shouldBe` 75
      it "should kill if damage is grater than currentHp" $ do
        isAlive (receiveDamage 100 (goblin "Makarax Hagglebub" 100 15)) `shouldBe` False
      it "should not drop currentHp below zero" $ do
        currentHp (receiveDamage 1000 (goblin "Makarax Hagglebub" 100 15)) `shouldBe` 0