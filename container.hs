module TheContainers (tests) where

import Test.HUnit
import qualified Data.Map as M

data Key = SomeKey deriving (Eq, Show, Ord)
data Value = SomeValue deriving (Eq, Show, Ord)

createMap = test [ "test1" ~: "empty" ~: (M.empty :: M.Map Key Value) ~?= M.fromList []
                 , "test2" ~: "singleton" ~: M.singleton "a" 65 ~?= M.fromList [("a",65)]
                 ]

tests = createMap
