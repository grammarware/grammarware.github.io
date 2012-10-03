@contributor{bgf2src automated exporter - SLPS}
module Antlr

syntax Program
        = 
        Function f+
 ;
syntax Function
        = 
        ID n ID a+ "=" Expr e NEWLINE+
 ;
syntax Expr
        = b: Binary
        | a: Apply
        | i: IfThenElse
 ;
syntax Binary
        = 
        Atom l (Ops o Atom r)*
 ;
syntax Apply
        = 
        ID i Atom a+
 ;
syntax IfThenElse
        = 
        "if" Expr c "then" Expr e1 "else" Expr e2
 ;
syntax Atom
        = ID
        | INT
        | "(" Expr e ")"
 ;
syntax Ops
        = "=="
        | "+"
        | "-"
 ;
