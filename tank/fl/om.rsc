@contributor{bgf2src automated exporter - SLPS}
module Om

syntax Apply
        = 
        String name Expr* args
 ;
syntax Argument
        = 
        name: String
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
        String name String* args Expr rhs
 ;
syntax IfThenElse
        = 
        Expr ifExpr Expr thenExpr Expr elseExpr
 ;
syntax Literal
        = 
        info: Integer
 ;
syntax Ops
        = Equal: ()
        | Plus: ()
        | Minus: ()
 ;
syntax Program
        = 
        functions: Function*
 ;
syntax Visitor
        = 
        ()
 ;
