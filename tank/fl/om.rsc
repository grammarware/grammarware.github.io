@contributor{bgf2src automated exporter - SLPS}
module Om

syntax Apply
        = 
        String name ANY* args
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
        String name ANY* args Expr rhs
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
syntax Program
        = 
        ANY* functions
 ;
syntax Visitor
        = 
        ()
 ;
