{-#LANGUAGE GADTs #-}
module Calc where


data Expr a where
  I   :: Int -> Expr Int
  B   :: Bool -> Expr Bool
  Add :: Expr Int -> Expr Int -> Expr Int
  Mul :: Expr Int -> Expr  Int -> Expr Int
  Eq :: (Eq a) => Expr a -> Expr a -> Expr Bool

eval :: Expr a -> a
eval (I n) = n
eval (B b) = b
eval (Add e1 e2) = eval e1 + eval e2
eval (Mul e1 e2) = eval e1 * eval e2
eval (Eq e1 e2) = eval e1 == eval e2


v1 = eval $ ( I 1 `Add` I 4 ) `Eq` I 7
v2 = eval $ ( I 1 `Add` I 4 ) `Eq` I 5

x1 = I 3 `Add` I 4 `Mul` I 9
x2 = x1 `Eq` (I 63)
