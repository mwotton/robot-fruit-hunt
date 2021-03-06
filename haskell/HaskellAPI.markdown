Read the tutorial [here](http://egonschiele.github.com/robot-fruit-hunt).

# The API

```haskell
type ItemType = Int

-- possible moves
data Move = ERR | EAST | NORTH | WEST | SOUTH | TAKE | PASS deriving (Enum, Eq, Ord)

-- width of game board
width :: Int

-- height of game board
height :: Int

-- current position of your bot
getMyX :: Int
getMyY :: Int

-- current position of your opponent
getOpponentX :: Int
getOpponentY :: Int

-- Returns the current board. It's an array of arrays.
getBoard :: [[ItemType]]

-- convenience function to return every position on the board
positions :: [(Int, Int)]

-- convenience function. For a given field (getBoard !! x !! y), if there's a fruit
-- at that field, returns the index of the fruit starting at 1. Returns Nothing if
-- there's no fruit there.
hasItem :: ItemType -> Maybe ItemType

-- Return the number of different fruit types. Each fruit type might be on the board
-- multiple times (use getTotalItemCount type) to query how often).
getNumberOfItemTypes :: Int

-- Returns the number of fruits you or your opponent have.
-- e.g. if (getMyItemCount 1) returns 3, you have 3 pieces of the fruit 1.
getMyItemCount :: ItemType -> Double
getOpponentItemCount :: ItemType -> Double

-- Returns the total number of fruits available for a given category.
-- E.g. if (getTotalItemCount 2) returns 5, a total of 5 fruits of type 2 exists
-- on the board and the players inventories.
getTotalItemCount :: ItemType -> Double

-- this is where you come in. Have this function return any value of type Move.
makeMove :: State (Map String String) Move
```
