module MyBot where

import Data.Maybe
import Data.Ord (comparing)
import Data.List (sortBy)
import Types
import Control.Monad.State
import qualified Data.Map as Map
import Data.Map(Map)
-- manhattan distance
dist (x1, y1) (x2, y2) = (abs $ x2 - x1) + (abs $ y2 - y1)

-- positions
--myPos = (getMyX, getMyY)
-- oppPos = (getOpponentX, getOpponentY)

for = flip map
 

moveTo :: Point -> Point -> Move
moveTo (myX, myY) (x, y)
    | myX < x = EAST
    | myX > x = WEST
    | myY < y = SOUTH
    | myY > y = NORTH
    | otherwise  = TAKE

makeMove :: Board -> Point -> Point -> [Point] -> State (Map String String) Move
makeMove board myPos oppPos positions = 
  return . moveTo myPos . head 
  $ sortBy (comparing $ dist myPos) 
  $ catMaybes $ for positions $ \(x, y) ->
  if (isJust . hasItem $ board !! x !! y)
  then Just (x, y)
  else Nothing
