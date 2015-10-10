{-#LANGUAGE GADTs #-}
module Calc where


  data Expr a where
    I   :: Int -> Expr Int
    B   :: Bool -> Expr Bool
    Add :: Expr Int -> Expr Int
    Mul :: Expr Int -> Expr  Int
    Eq  :: Expr a -> Expr a -> Expr Bool
  
