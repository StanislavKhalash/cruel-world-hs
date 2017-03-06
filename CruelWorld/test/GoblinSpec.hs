module GoblinSpec where

import Test.Hspec
import Creature
import Goblin

spec :: Spec
spec = do
  describe "Goblin" $ do
    it "should be initially alive" $
      isAlive (goblin "Makarax Hagglebub" 100 15) `shouldBe` True