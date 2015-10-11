{-#LANGUAGE GADTs #-}
{-#LANGUAGE EmptyDataDecls #-}


module SafeList where

data Empty
data NonEmpty

data SafeList a b where
  Nil  :: SafeList a Empty
  Cons :: a -> SafeList a b -> SafeList a NonEmpty

safeHead :: SafeList a NonEmpty -> a
safeHead (Cons x _) = x

-- this won't compile, see MarkedList for an example
-- of relaxing the restrictions on Cons so this function
-- can be created......sort of.
-- silly False = Nil
-- silly True = Cons () Nil
