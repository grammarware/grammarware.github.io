@contributor{bgf2src automated exporter - SLPS}
module Mediawiki_bnf

syntax Wiki_page
        = Redirect Article?
        | Article?
 ;
syntax Redirect
        = 
        Redirect_tag Characters Internal_link_start Article_link (Internal_link_end | Pipe | EOL)
 ;
syntax Redirect_tag
        = 
        "#redirect"
 ;
syntax Characters
        = 
        Character+
 ;
syntax Character
        = Whitespace_char
        | Non_whitespace_char
        | Html_entity
 ;
syntax Whitespace_char
        = Space_tab
        | Newline
 ;
syntax Space_tab
        = Space
        | TAB
 ;
syntax Space
        = 
        " "
 ;
syntax TAB
        = 
        "\\t"
 ;
syntax Newline
        = CR LF
        | LF CR
        | CR
        | LF
 ;
syntax CR
        = 
        "\\r"
 ;
syntax LF
        = 
        "\\n"
 ;
syntax Non_whitespace_char
        = Letter
        | Decimal_digit
        | Symbol
 ;
syntax Letter
        = Ucase_letter
        | Lcase_letter
 ;
syntax Ucase_letter
        = "A"
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
syntax Lcase_letter
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
syntax Symbol
        = Html_unsafe_symbol
        | Underscore
        | "."
        | ","
 ;
syntax Html_unsafe_symbol
        = Unescaped_ampersand
        | Unescaped_less_than
        | Unescaped_greater_than
 ;
syntax Unescaped_ampersand
        = 
        "&"
 ;
syntax Unescaped_less_than
        = 
        "\<"
 ;
syntax Unescaped_greater_than
        = 
        "\>"
 ;
syntax Underscore
        = 
        "_"
 ;
syntax Html_entity
        = "&" Html_entity_name ";"
        | "&#" Decimal_number ";"
        | "&#x" Hex_number ";"
 ;
syntax Html_entity_name
        = 
        WgHtmlEntities
 ;
syntax Decimal_number
        = 
        Decimal_digit+
 ;
syntax Hex_number
        = 
        Hex_digit+
 ;
syntax Hex_digit
        = Decimal_digit
        | "A"
        | "B"
        | "C"
        | "D"
        | "E"
        | "F"
        | "a"
        | "b"
        | "c"
        | "d"
        | "e"
        | "f"
 ;
syntax Internal_link_start
        = 
        "[["
 ;
syntax Article_link
        = (Interwiki_prefix | ":")? Namespace_prefix? Article_title
        | "/" Article_title
        | "../"* Article_title?
 ;
syntax Interwiki_prefix
        = 
        Interwiki ":"
 ;
syntax Interwiki
        = 
        "Wikipedia"
 ;
syntax Namespace_prefix
        = 
        Namespace? ":"
 ;
syntax Namespace
        = 
        String
 ;
syntax Article_title
        = Page Sub_page*
        | (Title_legal_char | "%")*
 ;
syntax Page
        = 
        Page_first_char Page_char*
 ;
syntax Page_first_char
        = Canonical_page_first_char
        | Lcase_letter
 ;
syntax Canonical_page_first_char
        = Ucase_letter
        | Decimal_digit
        | Underscore
 ;
syntax Page_char
        = Canonical_page_char
        | Space
 ;
syntax Canonical_page_char
        = Letter
        | Decimal_digit
        | Underscore
 ;
syntax Sub_page
        = 
        Sub_page_separator Page_char+
 ;
syntax Sub_page_separator
        = 
        "/"
 ;
syntax Title_legal_char
        = Space
        | "%"
        | "!"
        | "\""
        | "$"
        | "&"
        | "'"
        | "("
        | ")"
        | "*"
        | ","
        | "-"
        | "."
        | "/"
        | "0"
        | "1"
        | "2"
        | "3"
        | "4"
        | "5"
        | "6"
        | "7"
        | "8"
        | "9"
        | ":"
        | ";"
        | "="
        | "?"
        | "@"
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
        | "\\"
        | "^"
        | "_"
        | "`"
        | "a"
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
        | "~"
        | ""
        | ""
        | ""
        | ""
        | ""
        | ""
        | ""
        | ""
        | ""
        | ""
        | ""
        | ""
        | ""
        | ""
        | ""
        | ""
        | ""
        | ""
        | ""
        | ""
        | ""
        | ""
        | ""
        | ""
        | ""
        | ""
        | ""
        | ""
        | ""
        | ""
        | ""
        | ""
        | " "
        | "¡"
        | "¢"
        | "£"
        | "¤"
        | "¥"
        | "¦"
        | "§"
        | "¨"
        | "©"
        | "ª"
        | "«"
        | "¬"
        | "­"
        | "®"
        | "¯"
        | "°"
        | "±"
        | "²"
        | "³"
        | "´"
        | "µ"
        | "¶"
        | "·"
        | "¸"
        | "¹"
        | "º"
        | "»"
        | "¼"
        | "½"
        | "¾"
        | "¿"
        | "À"
        | "Á"
        | "Â"
        | "Ã"
        | "Ä"
        | "Å"
        | "Æ"
        | "Ç"
        | "È"
        | "É"
        | "Ê"
        | "Ë"
        | "Ì"
        | "Í"
        | "Î"
        | "Ï"
        | "Ð"
        | "Ñ"
        | "Ò"
        | "Ó"
        | "Ô"
        | "Õ"
        | "Ö"
        | "×"
        | "Ø"
        | "Ù"
        | "Ú"
        | "Û"
        | "Ü"
        | "Ý"
        | "Þ"
        | "ß"
        | "à"
        | "á"
        | "â"
        | "ã"
        | "ä"
        | "å"
        | "æ"
        | "ç"
        | "è"
        | "é"
        | "ê"
        | "ë"
        | "ì"
        | "í"
        | "î"
        | "ï"
        | "ð"
        | "ñ"
        | "ò"
        | "ó"
        | "ô"
        | "õ"
        | "ö"
        | "÷"
        | "ø"
        | "ù"
        | "ú"
        | "û"
        | "ü"
        | "ý"
        | "þ"
        | "ÿ"
        | "+"
 ;
syntax Internal_link_end
        = 
        "]]"
 ;
syntax Pipe
        = 
        "|"
 ;
syntax EOL
        = Newline
        | EOF
 ;
syntax Article
        = Special_block_and_more
        | Paragraph_and_more
 ;
syntax Special_block_and_more
        = 
        Special_block (EOF | (Newline? Special_block_and_more) | (Newline? Paragraph_and_more))
 ;
syntax Special_block
        = Horizontal_rule
        | Heading
        | List_item
        | Table
        | Space_block
 ;
syntax Horizontal_rule
        = 
        "----" Dashes? Inline_text? Newline
 ;
syntax Dashes
        = 
        "-"+
 ;
syntax Inline_text
        = 
        Inline_element Inline_text?
 ;
syntax Inline_element
        = Category_link
        | Link
        | Magic_link
        | Image_inline
        | Gallery_block
        | Media_inline
        | Text_with_formatting
 ;
syntax Category_link
        = 
        Internal_link_start Category_namespace ":" Article_title (Pipe Sort_key)? Internal_link_end
 ;
syntax Category_namespace
        = 
        "Category"
 ;
syntax Sort_key
        = 
        Any_text
 ;
syntax Any_text
        = 
        Unicode_character*
 ;
syntax Unicode_character
        = 
        ((Any_supported_unicode_character Whitespaces))
 ;
syntax Any_supported_unicode_character
        = 
        ANY
 ;
syntax Whitespaces
        = Newline
        | TAB
        | Space
 ;
syntax Link
        = Internal_link
        | External_link
 ;
syntax Internal_link
        = 
        Internal_link_start Article_link ("#" Section_id)? (Pipe Link_description?)? Internal_link_end Extra_description?
 ;
syntax Section_id
        = 
        (Title_legal_char | "%" | "#")*
 ;
syntax Link_description
        = 
        Article_title
 ;
syntax Extra_description
        = 
        Letter+
 ;
syntax External_link
        = External_link_start Url Whitespace? Link_description? External_link_end
        | Url
 ;
syntax External_link_start
        = 
        "["
 ;
syntax Url
        = 
        Protocol Url_path
 ;
syntax Protocol
        = "http://"
        | "https://"
        | "ftp://"
        | "ftps://"
        | "mailto:"
 ;
syntax Url_path
        = 
        Url_char Url_path?
 ;
syntax Url_char
        = 
        LEGAL_URL_ENTITY
 ;
syntax Whitespace
        = Whitespace_char Whitespace?
        | EOF
 ;
syntax External_link_end
        = 
        "]"
 ;
syntax Magic_link
        = Isbn
        | Rfc_number
        | Pmid_number
 ;
syntax Isbn
        = 
        "ISBN" Spaces Isbn_number
 ;
syntax Spaces
        = 
        Space+
 ;
syntax Isbn_number
        = 
        "97" ("8" | "9") (Space | "-")? Decimal_digit (Space | "-")? "9"* (Decimal_digit | "X" | "x")
 ;
syntax Rfc_number
        = 
        "RFC" Spaces Digits
 ;
syntax Digits
        = 
        Decimal_digit+
 ;
syntax Pmid_number
        = 
        "PMID" Spaces Digits
 ;
syntax Image_inline
        = 
        "[[" "Image:" Page_name "." Image_extension (Pipe Image_option)* "]]"
 ;
syntax Page_name
        = 
        Title_character (Space? Title_character)*
 ;
syntax Title_character
        = 
        ((Unicode_character Bad_title_characters))
 ;
syntax Bad_title_characters
        = "["
        | "]"
        | "{"
        | "}"
        | "\<"
        | "\>"
        | "_"
        | "|"
        | "#"
 ;
syntax Image_extension
        = "jpg"
        | "jpeg"
        | "png"
        | "svg"
        | "gif"
        | "bmp"
 ;
syntax Image_option
        = Image_mode_parameter
        | Image_size_parameter
        | Image_align_parameter
        | Image_valign_parameter
        | Caption
        | Image_other_parameter
 ;
syntax Image_mode_parameter
        = Image_mode_manual_thumb
        | Image_mode_auto_thumb
        | Image_mode_frame
        | Image_mode_frameless
 ;
syntax Image_mode_manual_thumb
        = "thumbnail=" Image_name
        | "thumb=" Image_name
 ;
syntax Image_name
        = 
        Page_name "." Image_extension
 ;
syntax Image_mode_auto_thumb
        = "thumbnail"
        | "thumb"
 ;
syntax Image_mode_frame
        = "framed"
        | "enframed"
        | "frame"
 ;
syntax Image_mode_frameless
        = 
        "frameless"
 ;
syntax Image_size_parameter
        = 
        Digits "px"
 ;
syntax Image_align_parameter
        = Image_align_left
        | Image_align_center
        | Image_align_right
        | Image_align_none
 ;
syntax Image_align_left
        = 
        "left"
 ;
syntax Image_align_center
        = "center"
        | "centre"
 ;
syntax Image_align_right
        = 
        "right"
 ;
syntax Image_align_none
        = 
        "none"
 ;
syntax Image_valign_parameter
        = Image_valign_baseline
        | Image_valign_sub
        | Image_valign_super
        | Image_valign_top
        | Image_valign_text_top
        | Image_valign_middle
        | Image_valign_bottom
        | Image_valign_text_bottom
 ;
syntax Image_valign_baseline
        = 
        "baseline"
 ;
syntax Image_valign_sub
        = 
        "sub"
 ;
syntax Image_valign_super
        = "super"
        | "sup"
 ;
syntax Image_valign_top
        = 
        "top"
 ;
syntax Image_valign_text_top
        = 
        "text-top"
 ;
syntax Image_valign_middle
        = 
        "middle"
 ;
syntax Image_valign_bottom
        = 
        "bottom"
 ;
syntax Image_valign_text_bottom
        = 
        "text-bottom"
 ;
syntax Caption
        = 
        Inline_text
 ;
syntax Image_other_parameter
        = Image_param_page
        | Image_param_upright
        | Image_param_border
 ;
syntax Image_param_page
        = "page=$1"
        | "page $1"
 ;
syntax Image_param_upright
        = 
        "upright" ("="? Digits)?
 ;
syntax Image_param_border
        = 
        "border"
 ;
syntax Gallery_block
        = 
        "\<gallery\>" Newline? Gallery_image (Newline? Gallery_image)* Newline? "\</gallery\>"
 ;
syntax Gallery_image
        = 
        Image_name ("|" Caption)?
 ;
syntax Media_inline
        = 
        "[[" "Media:" Page_name "." Media_extension "]]"
 ;
syntax Media_extension
        = "ogg"
        | "wav"
 ;
syntax Text_with_formatting
        = Formatting
        | Inline_html
        | Noparse_block
        | Behaviour_switch
        | Html_entity
        | Html_unsafe_symbol
        | Text
        | Random_character
 ;
syntax Formatting
        = Bold_italic_toggle
        | Bold_toggle
        | Italic_toggle
 ;
syntax Bold_italic_toggle
        = 
        "'''''"
 ;
syntax Bold_toggle
        = 
        "'''"
 ;
syntax Italic_toggle
        = 
        "''"
 ;
syntax Noparse_block
        = Nowiki_block
        | Html_block
        | Math_block
        | Pre_block
        | Html_comment
 ;
syntax Nowiki_block
        = 
        Nowiki_opening_tag Whitespace? Nowiki_body Whitespace? Nowiki_closing_tag?
 ;
syntax Nowiki_opening_tag
        = 
        "\<nowiki" (Whitespace Characters?)? "\>"
 ;
syntax Nowiki_body
        = 
        Characters
 ;
syntax Nowiki_closing_tag
        = 
        "\</nowiki" Whitespace? "\>"
 ;
syntax Html_block
        = 
        Html_opening_tag Whitespace? Html_body Whitespace? Html_closing_tag?
 ;
syntax Html_opening_tag
        = 
        "\<html" (Whitespace Characters?)? "\>"
 ;
syntax Html_body
        = 
        Characters
 ;
syntax Html_closing_tag
        = 
        "\</html" Whitespace? "\>"
 ;
syntax Pre_block
        = 
        Pre_opening_tag Whitespace? Pre_body Whitespace? Pre_closing_tag?
 ;
syntax Pre_opening_tag
        = 
        "\<pre" (Whitespace Characters?)? "\>"
 ;
syntax Pre_body
        = 
        Characters
 ;
syntax Pre_closing_tag
        = 
        "\</pre" Whitespace? "\>"
 ;
syntax Html_comment
        = 
        "\<!--" Characters? "--\>"
 ;
syntax Behaviour_switch
        = Behaviourswitch_toc
        | Behaviourswitch_forcetoc
        | Behaviourswitch_notoc
        | Behaviourswitch_noeditsection
        | Behaviourswitch_nogallery
 ;
syntax Behaviourswitch_toc
        = 
        "__TOC__"
 ;
syntax Behaviourswitch_forcetoc
        = 
        "__FORCETOC__"
 ;
syntax Behaviourswitch_notoc
        = 
        "__NOTOC__"
 ;
syntax Behaviourswitch_noeditsection
        = 
        "__NOEDITSECTION__"
 ;
syntax Behaviourswitch_nogallery
        = 
        "__NOGALLERY__"
 ;
syntax Text
        = Line+ (Newline+ Line+)*
        | Harmless_character+
 ;
syntax Line
        = 
        Plain_text+ (Spaces Plain_text+)*
 ;
syntax Plain_text
        = Unicode_wiki
        | "\<nowiki\>" ("|" | "[" | "]" | "\<" | "\>" | "{" | "}")* "\</nowiki\>"
        | Unicode_wiki Space* ("*" | "#" | ":" | ";")
        | Unicode_wiki Space? "=" Space? Unicode_wiki
        | Unicode_wiki "'"
        | " '" Unicode_wiki
 ;
syntax Unicode_wiki
        = 
        ((Unicode_character Wiki_markup_characters))
 ;
syntax Wiki_markup_characters
        = "|"
        | "["
        | "]"
        | "*"
        | "#"
        | ":"
        | ";"
        | "\<"
        | "\>"
        | "="
        | "'"
        | "{"
        | "}"
 ;
syntax Harmless_character
        = "A"
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
        | "a"
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
        | "0"
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
syntax Random_character
        = 
        ANY
 ;
syntax Heading
        = Level_6_heading
        | Level_5_heading
        | Level_4_heading
        | Level_3_heading
        | Level_2_heading
        | Level_1_heading
 ;
syntax Level_6_heading
        = 
        "======" Inline_text "======" Space_tabs Newline
 ;
syntax Space_tabs
        = 
        Space_tab+
 ;
syntax Level_5_heading
        = 
        "=====" Inline_text "=====" Space_tabs Newline
 ;
syntax Level_4_heading
        = 
        "====" Inline_text "====" Space_tabs Newline
 ;
syntax Level_3_heading
        = 
        "===" Inline_text "===" Space_tabs Newline
 ;
syntax Level_2_heading
        = 
        "==" Inline_text "==" Space_tabs Newline
 ;
syntax Level_1_heading
        = 
        "=" Inline_text "=" Space_tabs Newline
 ;
syntax List_item
        = Indent_item
        | Enumerated_item
        | Bullet_item
 ;
syntax Indent_item
        = 
        ":" (List_item | Item_body)?
 ;
syntax Item_body
        = Defined_term
        | Whitespace? Inline_text
 ;
syntax Defined_term
        = 
        ";" Text Definition?
 ;
syntax Definition
        = 
        ":" Inline_text
 ;
syntax Enumerated_item
        = 
        "#" (List_item | Item_body)?
 ;
syntax Bullet_item
        = 
        "*" (List_item | Item_body)?
 ;
syntax Table
        = 
        "{|" (Space Table_parameters)? Newline Table_first_row "|}"
 ;
syntax Table_parameters
        = CSS
        | Html_table_attributes
 ;
syntax Table_first_row
        = Table_column_line Newline
        | Table_column_multiline
        | Table_row
 ;
syntax Table_column_line
        = 
        "|" Inline_text ("|" Table_column_line)?
 ;
syntax Table_column_multiline
        = 
        "|" (Table_cell_parameters "|")? Any_text Newline Table_column_multiline?
 ;
syntax Table_cell_parameters
        = CSS
        | Html_cell_attributes
 ;
syntax Table_row
        = 
        "|-" CSS? Newline Table_column Table_row?
 ;
syntax Table_column
        = Table_column_line
        | Table_column_multiline
 ;
syntax Space_block
        = 
        Space Inline_text Newline Space_block_2*
 ;
syntax Space_block_2
        = 
        Space Inline_text? Newline
 ;
syntax Paragraph_and_more
        = 
        Paragraph (EOF | (Newline? Special_block_and_more) | (Newline Paragraph_and_more))
 ;
syntax Paragraph
        = Newline Lines_of_text?
        | Lines_of_text
 ;
syntax Lines_of_text
        = 
        Line_of_text Lines_of_text?
 ;
syntax Line_of_text
        = 
        Inline_text Newline
 ;
