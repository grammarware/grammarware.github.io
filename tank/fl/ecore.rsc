@contributor{bgf2src automated exporter - SLPS}
module Ecore

syntax Program
        = 
        Function function+
 ;
syntax Function
        = 
        String name Argument argument+ Exp definition
 ;
syntax Argument
        = 
        name: String
 ;
syntax Exp
        = LiteralExp
        | ArgumentExp
        | IfThenElseExp
        | ApplyExp
        | BinaryExp
 ;
syntax LiteralExp
        = 
        value: Integer
 ;
syntax ArgumentExp
        = 
        argument: Argument
 ;
syntax IfThenElseExp
        = 
        Exp if Exp then Exp else
 ;
syntax ApplyExp
        = 
        Function function Exp argument+
 ;
syntax BinaryExp
        = PlusExp
        | MinusExp
        | EqualExp
 ;
syntax PlusExp
        = 
        Exp left Exp right
 ;
syntax MinusExp
        = 
        Exp left Exp right
 ;
syntax EqualExp
        = 
        Exp left Exp right
 ;
