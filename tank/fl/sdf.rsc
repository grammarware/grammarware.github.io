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
        = binary: Expr Ops Expr
        | apply: Name Expr+
        | ifThenElse: "if" Expr "then" Expr "else" Expr
        | "(" Expr ")"
        | argument: Name
        | literal: Int
 ;
syntax Ops
        = minus: "-"
        | plus: "+"
        | equal: "=="
 ;
