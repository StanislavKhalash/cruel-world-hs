module AttackerSpec where

import Test.Hspec

import Attacker
import Creature
import Goblin

offenderWon :: Attacker a => (a, a) -> Bool
offenderWon (off, def) = isAlive off && isDead def

defenderWon :: Attacker a => (a, a) -> Bool
defenderWon (off, def) = isDead off && isAlive def

spec :: Spec
spec = do
  describe "duel" $ do
    it "offender should win if offender and defender are equally strong" $ do
      let offender = goblin "Makarax Hagglebub" 100 15
      let defender = goblin "Rixonk Fizzlegrubber" 100 15
      offenderWon (duel offender defender) `shouldBe` True

    it "offender should win if he has more health/damage ratio" $ do
      let offender = goblin "Makarax Hagglebub" 200 15
      let defender = goblin "Rixonk Fizzlegrubber" 100 15
      offenderWon (duel offender defender) `shouldBe` True

    it "offender should win if he has more health/damage ratio" $ do
      let offender = goblin "Makarax Hagglebub" 100 55
      let defender = goblin "Rixonk Fizzlegrubber" 100 15
      offenderWon (duel offender defender) `shouldBe` True

    it "defender should win if he has more health/damage ratio" $ do
      let offender = goblin "Makarax Hagglebub" 100 15
      let defender = goblin "Rixonk Fizzlegrubber" 100 55
      defenderWon (duel offender defender) `shouldBe` True

    it "defender should win if he has more health/damage ratio" $ do
      let offender = goblin "Makarax Hagglebub" 100 15
      let defender = goblin "Rixonk Fizzlegrubber" 200 35
      defenderWon (duel offender defender) `shouldBe` True