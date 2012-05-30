@contributor{bgf2src automated exporter - SLPS}
module Sdf

syntax Program
        = 
        Function+
 ;
syntax Function
        = 
        Name Name+ "=" Expr Newline+
 ;
syntax Expr
        = (Expr Ops Expr) binary
        | (Name Expr+) apply
        | ("if" Expr "then" Expr "else" Expr) ifThenElse
        | "(" Expr ")"
        | Name argument
        | Int literal
 ;
syntax Ops
        = "-" minus
        | "+" plus
        | "==" equal
 ;
