@contributor{bgf2src automated exporter - SLPS}
module Bgf

syntax Grammar
        = 
        Nonterminal root* Production*
 ;
syntax Production
        = 
        Label label? Nonterminal nonterminal Expression
 ;
syntax Expression
        = epsilon: ()
        | empty: ()
        | value: Value
        | any: ()
        | terminal: Terminal
        | nonterminal: Nonterminal
        | selectable: Selector selector Expression
        | sequence: Expression+
        | marked: Expression
        | choice: Expression+
        | optional: Expression
        | plus: Expression
        | star: Expression
        | seplistplus: Expression Expression
        | sepliststar: Expression Expression
 ;
syntax Value
        = int: ()
        | string: ()
 ;
syntax Label
        = 
        String
 ;
syntax Nonterminal
        = 
        String
 ;
syntax Selector
        = 
        String
 ;
syntax Terminal
        = 
        String
 ;
