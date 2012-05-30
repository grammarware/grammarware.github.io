@contributor{bgf2src automated exporter - SLPS}
module Iso_9899_tc2

syntax Translation_unit
        = External_declaration
        | Translation_unit External_declaration
 ;
syntax External_declaration
        = Function_definition
        | Declaration
 ;
syntax Function_definition
        = 
        Declaration_specifiers Declarator Declaration_list? Compound_statement
 ;
syntax Declaration_specifiers
        = Storage_class_specifier Declaration_specifiers?
        | Type_specifier Declaration_specifiers?
        | Type_qualifier Declaration_specifiers?
        | Function_specifier Declaration_specifiers?
 ;
syntax Storage_class_specifier
        = "typedef"
        | "extern"
        | "static"
        | "auto"
        | "register"
 ;
syntax Type_specifier
        = "void"
        | "char"
        | "short"
        | "int"
        | "long"
        | "float"
        | "double"
        | "signed"
        | "unsigned"
        | "_Bool"
        | "_Complex"
        | Struct_or_union_specifier
        | Enum_specifier
        | Typedef_name
 ;
syntax Struct_or_union_specifier
        = Struct_or_union Identifier? "{" Struct_declaration_list "}"
        | Struct_or_union Identifier
 ;
syntax Struct_or_union
        = "struct"
        | "union"
 ;
syntax Struct_declaration_list
        = Struct_declaration
        | Struct_declaration_list Struct_declaration
 ;
syntax Struct_declaration
        = 
        Specifier_qualifier_list Struct_declarator_list ";"
 ;
syntax Specifier_qualifier_list
        = Type_specifier Specifier_qualifier_list?
        | Type_qualifier Specifier_qualifier_list?
 ;
syntax Type_qualifier
        = "const"
        | "restrict"
        | "volatile"
 ;
syntax Struct_declarator_list
        = Struct_declarator
        | Struct_declarator_list "," Struct_declarator
 ;
syntax Struct_declarator
        = Declarator
        | Declarator? ":" Constant_expression
 ;
syntax Declarator
        = 
        Pointer? Direct_declarator
 ;
syntax Pointer
        = "*" Type_qualifier_list?
        | "*" Type_qualifier_list? Pointer
 ;
syntax Type_qualifier_list
        = Type_qualifier
        | Type_qualifier_list Type_qualifier
 ;
syntax Direct_declarator
        = Identifier
        | "(" Declarator ")"
        | Direct_declarator "[" Type_qualifier_list? Assignment_expression? "]"
        | Direct_declarator "[" "static" Type_qualifier_list? Assignment_expression "]"
        | Direct_declarator "[" Type_qualifier_list "static" Assignment_expression "]"
        | Direct_declarator "[" Type_qualifier_list? "*" "]"
        | Direct_declarator "(" Parameter_type_list ")"
        | Direct_declarator "(" Identifier_list? ")"
 ;
syntax Assignment_expression
        = Conditional_expression
        | Unary_expression Assignment_operator Assignment_expression
 ;
syntax Conditional_expression
        = Logical_OR_expression
        | Logical_OR_expression "?" Expression ":" Conditional_expression
 ;
syntax Logical_OR_expression
        = Logical_AND_expression
        | Logical_OR_expression "||" Logical_AND_expression
 ;
syntax Logical_AND_expression
        = Inclusive_OR_expression
        | Logical_AND_expression "&&" Inclusive_OR_expression
 ;
syntax Inclusive_OR_expression
        = Exclusive_OR_expression
        | Inclusive_OR_expression "|" Exclusive_OR_expression
 ;
syntax Exclusive_OR_expression
        = AND_expression
        | Exclusive_OR_expression "^" AND_expression
 ;
syntax AND_expression
        = Equality_expression
        | AND_expression "&" Equality_expression
 ;
syntax Equality_expression
        = Relational_expression
        | Equality_expression "==" Relational_expression
        | Equality_expression "!=" Relational_expression
 ;
syntax Relational_expression
        = Shift_expression
        | Relational_expression "\<" Shift_expression
        | Relational_expression "\>" Shift_expression
        | Relational_expression "\<=" Shift_expression
        | Relational_expression "\>=" Shift_expression
 ;
syntax Shift_expression
        = Additive_expression
        | Shift_expression "\<\<" Additive_expression
        | Shift_expression "\>\>" Additive_expression
 ;
syntax Additive_expression
        = Multiplicative_expression
        | Additive_expression "+" Multiplicative_expression
        | Additive_expression "-" Multiplicative_expression
 ;
syntax Multiplicative_expression
        = Cast_expression
        | Multiplicative_expression "*" Cast_expression
        | Multiplicative_expression "/" Cast_expression
        | Multiplicative_expression "%" Cast_expression
 ;
syntax Cast_expression
        = Unary_expression
        | "(" Type_name ")" Cast_expression
 ;
syntax Unary_expression
        = Postfix_expression
        | "++" Unary_expression
        | "--" Unary_expression
        | Unary_operator Cast_expression
        | "sizeof" Unary_expression
        | "sizeof" "(" Type_name ")"
 ;
syntax Postfix_expression
        = Primary_expression
        | Postfix_expression "[" Expression "]"
        | Postfix_expression "(" Argument_expression_list? ")"
        | Postfix_expression "." Identifier
        | Postfix_expression "-\>" Identifier
        | Postfix_expression "++"
        | Postfix_expression "--"
        | "(" Type_name ")" "{" Initializer_list "}"
        | "(" Type_name ")" "{" Initializer_list "," "}"
 ;
syntax Primary_expression
        = Identifier
        | Constant
        | String_literal
        | "(" Expression ")"
 ;
syntax Expression
        = Assignment_expression
        | Expression "," Assignment_expression
 ;
syntax Argument_expression_list
        = Assignment_expression
        | Argument_expression_list "," Assignment_expression
 ;
syntax Type_name
        = 
        Specifier_qualifier_list Abstract_declarator?
 ;
syntax Abstract_declarator
        = Pointer
        | Pointer? Direct_abstract_declarator
 ;
syntax Direct_abstract_declarator
        = "(" Abstract_declarator ")"
        | Direct_abstract_declarator? "[" Assignment_expression? "]"
        | Direct_abstract_declarator? "[" "*" "]"
        | Direct_abstract_declarator? "(" Parameter_type_list? ")"
 ;
syntax Parameter_type_list
        = Parameter_list
        | Parameter_list "," "..."
 ;
syntax Parameter_list
        = Parameter_declaration
        | Parameter_list "," Parameter_declaration
 ;
syntax Parameter_declaration
        = Declaration_specifiers Declarator
        | Declaration_specifiers Abstract_declarator?
 ;
syntax Initializer_list
        = Designation? Initializer
        | Initializer_list "," Designation? Initializer
 ;
syntax Designation
        = 
        Designator_list "="
 ;
syntax Designator_list
        = Designator
        | Designator_list Designator
 ;
syntax Designator
        = "[" Constant_expression "]"
        | "." Identifier
 ;
syntax Constant_expression
        = 
        Conditional_expression
 ;
syntax Initializer
        = Assignment_expression
        | "{" Initializer_list "}"
        | "{" Initializer_list "," "}"
 ;
syntax Unary_operator
        = "&"
        | "*"
        | "+"
        | "-"
        | "~"
        | "!"
 ;
syntax Assignment_operator
        = "="
        | "*="
        | "/="
        | "%="
        | "+="
        | "-="
        | "\<\<="
        | "\>\>="
        | "&="
        | "^="
        | "|="
 ;
syntax Identifier_list
        = Identifier
        | Identifier_list "," Identifier
 ;
syntax Enum_specifier
        = "enum" Identifier? "{" Enumerator_list "}"
        | "enum" Identifier? "{" Enumerator_list "," "}"
        | "enum" Identifier
 ;
syntax Enumerator_list
        = Enumerator
        | Enumerator_list "," Enumerator
 ;
syntax Enumerator
        = Enumeration_constant
        | Enumeration_constant "=" Constant_expression
 ;
syntax Typedef_name
        = 
        Identifier
 ;
syntax Function_specifier
        = 
        "inline"
 ;
syntax Declaration_list
        = Declaration
        | Declaration_list Declaration
 ;
syntax Declaration
        = 
        Declaration_specifiers Init_declarator_list? ";"
 ;
syntax Init_declarator_list
        = Init_declarator
        | Init_declarator_list "," Init_declarator
 ;
syntax Init_declarator
        = Declarator
        | Declarator "=" Initializer
 ;
syntax Compound_statement
        = 
        "{" Block_item_list? "}"
 ;
syntax Block_item_list
        = Block_item
        | Block_item_list Block_item
 ;
syntax Block_item
        = Declaration
        | Statement
 ;
syntax Statement
        = Labeled_statement
        | Compound_statement
        | Expression_statement
        | Selection_statement
        | Iteration_statement
        | Jump_statement
 ;
syntax Labeled_statement
        = Identifier ":" Statement
        | "case" Constant_expression ":" Statement
        | "default" ":" Statement
 ;
syntax Expression_statement
        = 
        Expression? ";"
 ;
syntax Selection_statement
        = "if" "(" Expression ")" Statement
        | "if" "(" Expression ")" Statement "else" Statement
        | "switch" "(" Expression ")" Statement
 ;
syntax Iteration_statement
        = "while" "(" Expression ")" Statement
        | "do" Statement "while" "(" Expression ")" ";"
        | "for" "(" Expression? ";" Expression? ";" Expression? ")" Statement
        | "for" "(" Declaration Expression? ";" Expression? ")" Statement
 ;
syntax Jump_statement
        = "goto" Identifier ";"
        | "continue" ";"
        | "break" ";"
        | "return" Expression? ";"
 ;
