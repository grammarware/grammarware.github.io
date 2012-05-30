@contributor{bgf2src automated exporter - SLPS}
module Mediawiki_ebnf

syntax Digit
        = "1"
        | "2"
        | "3"
        | "4"
        | "5"
        | "6"
        | "7"
        | "8"
        | "9"
        | "0"
 ;
syntax URL
        = 
        ASCII_letter* "://" URL_char*
 ;
syntax ASCII_letter
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
syntax URL_char
        = ASCII_letter
        | Digit
        | "-"
        | "_"
        | "."
        | "~"
        | "!"
        | "*"
        | "'"
        | "("
        | ")"
        | ";"
        | ":"
        | "@"
        | "&"
        | "="
        | "+"
        | "$"
        | ","
        | "/"
        | "?"
        | "%"
        | "#"
        | "["
        | "]"
 ;
syntax Text
        = 
        Unicode_char*
 ;
syntax Full_pagename
        = 
        ((Namespace ":") | ":")? Pagename
 ;
syntax Namespace
        = 
        Unicode_char Unicode_char*
 ;
syntax Pagename
        = 
        Unicode_char Unicode_char*
 ;
syntax Start_link
        = 
        "[["
 ;
syntax End_link
        = 
        "]]"
 ;
syntax Internal_link
        = 
        Start_link Full_pagename ("|" Label)? End_link Label_extension
 ;
syntax External_link
        = URL
        | Start_link URL (Whitespace Label)? End_link Label_extension
 ;
syntax Redirect
        = 
        "#REDIRECT" Internal_link
 ;
syntax Header_link
        = 
        "/*" Text "*/"
 ;
syntax ISBN_link
        = 
        Digit ("-" | " ")? Digit Digit Digit ("-" | " ")? Digit Digit Digit Digit Digit (("-" | " ") (Digit | "X" | "x"))?
 ;
syntax Header_end
        = 
        Whitespace? Line_break
 ;
syntax Header6
        = 
        Line_break "======" Whitespace? Text Whitespace? "======" Header_end
 ;
syntax Header5
        = 
        Line_break "=====" Whitespace? Text Whitespace? "=====" Header_end
 ;
syntax Header4
        = 
        Line_break "====" Whitespace? Text Whitespace? "====" Header_end
 ;
syntax Header3
        = 
        Line_break "===" Whitespace? Text Whitespace? "===" Header_end
 ;
syntax Header2
        = 
        Line_break "==" Whitespace? Text Whitespace? "==" Header_end
 ;
syntax Header1
        = 
        Line_break "=" Whitespace? Text Whitespace? "=" Header_end
 ;
syntax Comment
        = 
        "\<!--" Text? "--\>"
 ;
syntax Commentary
        = 
        "\<comment" Text? "\>" Text? "\</comment\>"
 ;
syntax Horizontal_rule
        = 
        "----" "-"*
 ;
syntax Bold_italic_text
        = 
        "'''''" Text "'''''"
 ;
syntax Bold_text
        = 
        "'''" Text "'''"
 ;
syntax Italic_text
        = 
        "''" Text "''"
 ;
syntax Code_line
        = 
        Line_break " " Text
 ;
syntax Nowiki
        = 
        "\<nowiki\>" Text "\</nowiki\>"
 ;
syntax Unordered_list
        = 
        "*" Text
 ;
syntax Continue_unordered_list
        = 
        (Unordered_list | Continue_unordered_list | ":" | "*" | "#") Line_break Unordered_list
 ;
syntax Ordered_list
        = 
        "#" Text
 ;
syntax Continue_ordered_list
        = 
        (Ordered_list | Continue_ordered_list | ":" | "*" | "#") Line_break Ordered_list
 ;
syntax Definition_list
        = 
        Text? ":" Text
 ;
syntax Continue_definition_list
        = 
        (Definition_list | Continue_definition_list | ":" | "*" | "#") Line_break Definition_list
 ;
syntax User_signature
        = 
        "~~~"
 ;
syntax User_signature_with_date
        = 
        "~~~~"
 ;
syntax Current_date
        = 
        "~~~~~"
 ;
syntax Include
        = Template
        | Tplarg
 ;
syntax Template
        = 
        "{{" Title ("|" Part)* "}}"
 ;
syntax Tplarg
        = 
        "{{{" Title ("|" Part)* "}}}"
 ;
syntax Part
        = 
        (Name "=")? Value
 ;
syntax Title
        = 
        Balanced_text
 ;
syntax Name
        = 
        Balanced_text
 ;
syntax Value
        = 
        Balanced_text
 ;
syntax Balanced_text
        = 
        Text_without_consecutive_equal_braces (Include Text_without_consecutive_equal_braces)*
 ;
syntax Place_TOC
        = 
        (Whitespace | Line_break)* "__TOC__" (Whitespace | Line_break)*
 ;
syntax Force_TOC
        = 
        (Whitespace | Line_break)* "__FORCETOC__" (Whitespace | Line_break)*
 ;
syntax Disable_TOC
        = 
        (Whitespace | Line_break)* "__NOTOC__" (Whitespace | Line_break)*
 ;
syntax Disable_section_edit
        = 
        (Whitespace | Line_break)* "__NOEDITSECTION__" (Whitespace | Line_break)*
 ;
syntax Table_start
        = 
        "{|" (Style | Whitespace)* Line_break
 ;
syntax Table_end
        = 
        "|}"
 ;
syntax Table_header
        = 
        "|+" Text Line_break
 ;
syntax Table_header_cell
        = Line_break "!" (Style | Whitespace)* Text
        | Table_cell ("!!" | "||") (Style | Whitespace)* Text
 ;
syntax Table_cell
        = Line_break "|" (Style | Whitespace)* Text
        | Table_cell "||" (Style | Whitespace)* Text
 ;
syntax Table_row
        = 
        Line_break "|-" "-"* (Style | Whitespace)* Line_break
 ;
syntax Table_body
        = 
        (Table_header_cell | Table_cell) (Table_row (Table_header_cell | Table_cell))*
 ;
syntax Table
        = 
        Table_start Table_header? Table_row? Table_body Table_end
 ;
syntax Unicode_char
        = 
        ANY
 ;
syntax Header
        = Header1
        | Header2
        | Header3
        | Header4
        | Header5
        | Header6
 ;
