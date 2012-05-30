@contributor{bgf2src automated exporter - SLPS}
module Antlr

syntax Program
        = 
        Function+
 ;
syntax Function
        = 
        ID ID+ "=" Expr NEWLINE+
 ;
syntax Expr
        = Binary
        | Apply
        | IfThenElse
 ;
syntax Binary
        = 
        Atom (Ops Atom)*
 ;
syntax Apply
        = 
        ID Atom+
 ;
syntax IfThenElse
        = 
        "if" Expr "then" Expr "else" Expr
 ;
syntax Atom
        = ID
        | INT
        | "(" Expr ")"
 ;
syntax Ops
        = "=="
        | "+"
        | "-"
 ;
