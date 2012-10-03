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
        = binary: Atom (Ops Atom)*
        | apply: Name Atom+
        | ifThenElse: "if" Expr "then" Expr "else" Expr
 ;
syntax Atom
        = literal: Int
        | argument: Name
        | "(" Expr ")"
 ;
syntax Ops
        = equal: "=="
        | plus: "+"
        | minus: "-"
 ;
