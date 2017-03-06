module LibSpec where

import Test.Hspec
import Lib

spec :: Spec
spec = do
  describe "someFunc" $ do
    it "returns 42" $
      someFunc `shouldBe` 42