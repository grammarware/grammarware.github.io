@contributor{bgf2src automated exporter - SLPS}
module Ecore2

syntax Apply
        = 
        String name Expr arg+
 ;
syntax Argument
        = 
        String name
 ;
syntax Binary
        = 
        Ops ops Expr left Expr right
 ;
syntax Expr
        = Apply
        | Argument
        | Binary
        | IfThenElse
        | Literal
 ;
syntax Function
        = 
        String name String arg+ Expr rhs
 ;
syntax IfThenElse
        = 
        Expr ifExpr Expr thenExpr Expr elseExpr
 ;
syntax Literal
        = 
        Integer info
 ;
syntax Ops
        = () Equal
        | () Plus
        | () Minus
 ;
syntax ProgramType
        = 
        Function function+
 ;
