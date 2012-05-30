@contributor{bgf2src automated exporter - SLPS}
module Jaxb

syntax Apply
        = 
        String Name ANY* Arg
 ;
syntax Argument
        = 
        String Name
 ;
syntax Binary
        = 
        Ops Ops Expr Left Expr Right
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
        String Name ANY* Arg Expr Rhs
 ;
syntax IfThenElse
        = 
        Expr IfExpr Expr ThenExpr Expr ElseExpr
 ;
syntax Literal
        = 
        Integer Info
 ;
syntax ObjectFactory
        = 
        ()
 ;
syntax Ops
        = () EQUAL
        | () PLUS
        | () MINUS
 ;
syntax Package_info
        = 
        ()
 ;
syntax Program
        = 
        ANY* Function
 ;
