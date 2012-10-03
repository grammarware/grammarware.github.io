@contributor{bgf2src automated exporter - SLPS}
module Xsd

syntax Program
        = 
        Function function+
 ;
syntax Fragment
        = 
        Expr
 ;
syntax Function
        = 
        String name String arg+ Expr rhs
 ;
syntax Expr
        = Literal
        | Argument
        | Binary
        | IfThenElse
        | Apply
 ;
syntax Literal
        = 
        info: Integer
 ;
syntax Argument
        = 
        name: String
 ;
syntax Binary
        = 
        Ops ops Expr left Expr right
 ;
syntax Ops
        = Equal: ()
        | Plus: ()
        | Minus: ()
 ;
syntax IfThenElse
        = 
        Expr ifExpr Expr thenExpr Expr elseExpr
 ;
syntax Apply
        = 
        String name Expr arg+
 ;
