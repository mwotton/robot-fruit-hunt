module Types where

type ItemType = Int
data Move = ERR | EAST | NORTH | WEST | SOUTH | TAKE | PASS deriving (Enum, Eq, Ord)

instance Show Move where
  show = show . fromEnum

type Point = (Int, Int)

hasItem :: ItemType -> Maybe ItemType
hasItem field = if field > 0
                  then Just field
                  else Nothing

type Board = [[ItemType]]