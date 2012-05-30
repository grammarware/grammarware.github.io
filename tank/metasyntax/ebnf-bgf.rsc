@contributor{bgf2src automated exporter - SLPS}
module Ebnf_bgf

syntax Grammar
        = 
        Production+
 ;
syntax Production
        = 
        Label? String Defining_metasymbol Right_hand_side Terminator_metasymbol
 ;
syntax Label
        = 
        "[" String "]"
 ;
syntax Defining_metasymbol
        = 
        ":"
 ;
syntax Right_hand_side
        = 
        (Definition_separator_metasymbol Definition)+
 ;
syntax Terminator_metasymbol
        = 
        "\\n"
 ;
syntax Definition_separator_metasymbol
        = 
        "\\n" "        "
 ;
syntax Definition
        = 
        Expression (" " Expression)*
 ;
syntax Expression
        = Empty
        | Epsilon
        | Any
        | Value
        | Selectable_expression
        | Marked_expression
        | Repetition_expression
        | Optional_expression
        | Terminal
        | Nonterminal
        | Group_expression
 ;
syntax Empty
        = 
        "EMPTY"
 ;
syntax Epsilon
        = 
        "EPSILON"
 ;
syntax Any
        = 
        "ANY"
 ;
syntax Value
        = "INT"
        | "STR"
 ;
syntax Selectable_expression
        = 
        String selector "::" Expression
 ;
syntax Marked_expression
        = 
        "\<" Expression "\>"
 ;
syntax Repetition_expression
        = 
        Expression Repetition_metasymbol
 ;
syntax Repetition_metasymbol
        = "+"
        | "*"
 ;
syntax Optional_expression
        = 
        Expression Optionality_metasymbol
 ;
syntax Optionality_metasymbol
        = 
        "?"
 ;
syntax Terminal
        = 
        Start_terminal_metasymbol String End_terminal_metasymbol
 ;
syntax Start_terminal_metasymbol
        = 
        "\""
 ;
syntax End_terminal_metasymbol
        = 
        "\""
 ;
syntax Nonterminal
        = 
        Start_nonterminal_metasymbol String End_nonterminal_metasymbol
 ;
syntax Start_nonterminal_metasymbol
        = 
        ()
 ;
syntax End_nonterminal_metasymbol
        = 
        ()
 ;
syntax Group_expression
        = 
        Start_group_metasymbol Expression End_group_metasymbol
 ;
syntax Start_group_metasymbol
        = 
        "("
 ;
syntax End_group_metasymbol
        = 
        ")"
 ;
