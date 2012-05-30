@contributor{bgf2src automated exporter - SLPS}
module Dcg

syntax Program
        = 
        Function+
 ;
syntax Function
        = 
        Name Name+ "=" Expr Newline+
 ;
syntax Expr
        = (Atom (Ops Atom)*) binary
        | (Name Atom+) apply
        | ("if" Expr "then" Expr "else" Expr) ifThenElse
 ;
syntax Atom
        = Int literal
        | Name argument
        | "(" Expr ")"
 ;
syntax Ops
        = "==" equal
        | "+" plus
        | "-" minus
 ;
