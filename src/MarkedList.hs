{-#LANGUAGE GADTs #-}
{-#LANGUAGE EmptyDataDecls #-}
{-#LANGUAGE KindSignatures #-}

module MarkedList where

data NotSafe
data Safe

data MarkedList    :: * -> * -> * where
  Nil              :: MarkedList t NotSafe
  Cons             :: a -> MarkedList a b -> MarkedList a c

safeHead :: MarkedList a Safe -> a
safeHead (Cons x _) = x

silly :: Bool -> MarkedList () NotSafe
silly False = Nil
silly True = Cons () Nil
