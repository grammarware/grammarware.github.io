@contributor{bgf2src automated exporter - SLPS}
module Ebnf_iso_1

syntax Letter
        = "a"
        | "b"
        | "c"
        | "d"
        | "e"
        | "f"
        | "g"
        | "h"
        | "i"
        | "j"
        | "k"
        | "l"
        | "m"
        | "n"
        | "o"
        | "p"
        | "q"
        | "r"
        | "s"
        | "t"
        | "u"
        | "v"
        | "w"
        | "x"
        | "y"
        | "z"
        | "A"
        | "B"
        | "C"
        | "D"
        | "E"
        | "F"
        | "G"
        | "H"
        | "I"
        | "J"
        | "K"
        | "L"
        | "M"
        | "N"
        | "O"
        | "P"
        | "Q"
        | "R"
        | "S"
        | "T"
        | "U"
        | "V"
        | "W"
        | "X"
        | "Y"
        | "Z"
 ;
syntax Decimal_digit
        = "0"
        | "1"
        | "2"
        | "3"
        | "4"
        | "5"
        | "6"
        | "7"
        | "8"
        | "9"
 ;
syntax Concatenate_symbol
        = 
        ","
 ;
syntax Defining_symbol
        = 
        "="
 ;
syntax Definition_separator_symbol
        = "|"
        | "/"
        | "!"
 ;
syntax End_comment_symbol
        = 
        "*)"
 ;
syntax End_group_symbol
        = 
        ")"
 ;
syntax End_option_symbol
        = "]"
        | "/)"
 ;
syntax End_repeat_symbol
        = "}"
        | ":)"
 ;
syntax Except_symbol
        = 
        "-"
 ;
syntax First_quote_symbol
        = 
        "’"
 ;
syntax Repetition_symbol
        = 
        "*"
 ;
syntax Second_quote_symbol
        = 
        "\""
 ;
syntax Special_sequence_symbol
        = 
        "?"
 ;
syntax Start_comment_symbol
        = 
        "(*"
 ;
syntax Start_group_symbol
        = 
        "("
 ;
syntax Start_option_symbol
        = "["
        | "(/"
 ;
syntax Start_repeat_symbol
        = "{"
        | "(:"
 ;
syntax Terminator_symbol
        = ";"
        | "."
 ;
syntax Other_character
        = " "
        | ":"
        | "+"
        | "_"
        | "%"
        | "@"
        | "&"
        | "#"
        | "$"
        | "\<"
        | "\>"
        | "\\"
        | "^"
        | "‘"
        | "~"
 ;
syntax Space_character
        = 
        " "
 ;
syntax Horizontal_tabulation_character
        = 
        "\\t"
 ;
syntax New_line
        = 
        "\\r"* "\\n" "\\r"*
 ;
syntax Vertical_tabulation_character
        = 
        "\\v"
 ;
syntax Form_feed
        = 
        "\\f"
 ;
syntax Terminal_character
        = Letter
        | Decimal_digit
        | Concatenate_symbol
        | Defining_symbol
        | Definition_separator_symbol
        | End_comment_symbol
        | End_group_symbol
        | End_option_symbol
        | End_repeat_symbol
        | Except_symbol
        | First_quote_symbol
        | Repetition_symbol
        | Second_quote_symbol
        | Special_sequence_symbol
        | Start_comment_symbol
        | Start_group_symbol
        | Start_option_symbol
        | Start_repeat_symbol
        | Terminator_symbol
        | Other_character
 ;
syntax Gap_free_symbol
        = Terminal_character
        | Terminal_string
 ;
syntax Terminal_string
        = First_quote_symbol First_terminal_character+ First_quote_symbol
        | Second_quote_symbol Second_terminal_character+ Second_quote_symbol
 ;
syntax First_terminal_character
        = 
        Terminal_character
 ;
syntax Second_terminal_character
        = 
        Terminal_character
 ;
syntax Gap_separator
        = Space_character
        | Horizontal_tabulation_character
        | New_line
        | Vertical_tabulation_character
        | Form_feed
 ;
syntax Syntax
        = Gap_separator* (Gap_free_symbol Gap_separator*)+
        | Bracketed_textual_comment* Commentless_symbol Bracketed_textual_comment* (Commentless_symbol Bracketed_textual_comment*)*
        | Syntax_rule+
 ;
syntax Commentless_symbol
        = Terminal_character
        | Meta_identifier
        | Integer
        | Terminal_string
        | Special_sequence
 ;
syntax Integer
        = 
        Decimal_digit+
 ;
syntax Meta_identifier
        = 
        Letter Meta_identifier_character*
 ;
syntax Meta_identifier_character
        = Letter
        | Decimal_digit
 ;
syntax Special_sequence
        = 
        Special_sequence_symbol Special_sequence_character* Special_sequence_symbol
 ;
syntax Special_sequence_character
        = 
        Terminal_character
 ;
syntax Comment_symbol
        = Bracketed_textual_comment
        | Other_character
        | Commentless_symbol
 ;
syntax Bracketed_textual_comment
        = 
        Start_comment_symbol Comment_symbol* End_comment_symbol
 ;
syntax Syntax_rule
        = 
        Meta_identifier Defining_symbol Definitions_list Terminator_symbol
 ;
syntax Definitions_list
        = 
        Single_definition (Definition_separator_symbol Single_definition)*
 ;
syntax Single_definition
        = 
        Syntactic_term (Concatenate_symbol Syntactic_term)*
 ;
syntax Syntactic_term
        = 
        Syntactic_factor (Except_symbol Syntactic_exception)?
 ;
syntax Syntactic_exception
        = 
        Syntactic_factor
 ;
syntax Syntactic_factor
        = 
        (Integer Repetition_symbol)? Syntactic_primary
 ;
syntax Syntactic_primary
        = Optional_sequence
        | Repeated_sequence
        | Grouped_sequence
        | Meta_identifier
        | Terminal_string
        | Special_sequence
        | Empty_sequence
 ;
syntax Optional_sequence
        = 
        Start_option_symbol Definitions_list End_option_symbol
 ;
syntax Repeated_sequence
        = 
        Start_repeat_symbol Definitions_list End_repeat_symbol
 ;
syntax Grouped_sequence
        = 
        Start_group_symbol Definitions_list End_group_symbol
 ;
syntax Empty_sequence
        = 
        ()
 ;
