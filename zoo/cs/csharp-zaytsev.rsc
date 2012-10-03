@contributor{bgf2src automated exporter - SLPS}
module Csharp_zaytsev

syntax Ref_or_out
        = "ref"
        | "out"
 ;
syntax Expression_unary_operator
        = Lex_csharp_extra/plus
        | Lex_csharp_extra/minus
        | Increment_decrement
        | "!"
        | "~"
        | "*"
 ;
syntax Increment_decrement
        = "++"
        | "--"
 ;
syntax Expression_shift_operator
        = "\<\<"
        | "\>\>"
 ;
syntax Expression_relational_operator
        = Lex_csharp_extra/less_than
        | Lex_csharp_extra/greater_than
        | "\<="
        | "\>="
        | "is"
        | "as"
 ;
syntax Expression_equality_operator
        = "=="
        | "!="
 ;
syntax Conversion_kind
        = "implicit"
        | "explicit"
 ;
syntax Maybe_empty_block
        = "{" Statement* "}"
        | ";"
 ;
syntax Built_in_type
        = Integral_type
        | Built_in_class_type
        | "bool"
        | "decimal"
        | "float"
        | "double"
 ;
syntax Built_in_class_type
        = "object"
        | "string"
 ;
syntax Else_part
        = 
        "else" Embedded_statement
 ;
syntax Qualified_identifier_list
        = 
        
	Qualified_identifier
	","
      
 ;
syntax Compilation_unit
        = 
        Using_directive* Global_attributes Namespace_member_declaration*
 ;
syntax Type
        = 
        Non_array_type Rank_specifier*
 ;
syntax Integral_type
        = "sbyte"
        | "byte"
        | "short"
        | "ushort"
        | "int"
        | "uint"
        | "long"
        | "ulong"
        | "char"
 ;
syntax Argument_list
        = 
        
	Argument
	","
      
 ;
syntax Argument
        = 
        Ref_or_out? Expression
 ;
syntax Primary_expression
        = "new" Non_array_type "[" Expression_list "]" Rank_specifier* Array_initializer?
        | "new" Array_type Array_initializer
        | Lex_csharp/literal
        | Lex_csharp/identifier
        | "(" Expression ")"
        | Primary_expression "." Lex_csharp/identifier
        | Predefined_type "." Lex_csharp/identifier
        | Primary_expression "(" Argument_list ")"
        | Primary_expression "[" Expression_list "]"
        | "this"
        | "base" "." Lex_csharp/identifier
        | "base" "[" Expression_list "]"
        | Primary_expression Increment_decrement
        | "new" Type "(" Argument_list ")"
        | "typeof" "(" Type_or_void ")"
        | "checked" "(" Expression ")"
        | "unchecked" "(" Expression ")"
 ;
syntax Predefined_type
        = "bool"
        | "byte"
        | "char"
        | "decimal"
        | "double"
        | "float"
        | "int"
        | "long"
        | "object"
        | "sbyte"
        | "short"
        | "string"
        | "uint"
        | "ulong"
        | "ushort"
 ;
syntax Expression_list
        = 
        
	Expression
	","
      
 ;
syntax Unary_expression
        = Expression_unary_operator Unary_expression
        | "(" Type ")" Unary_expression
        | Primary_expression
 ;
syntax Assignment_operator
        = "="
        | "+="
        | "-="
        | "*="
        | "/="
        | "%="
        | "&="
        | "|="
        | "^="
        | "\<\<="
        | "\>\>="
 ;
syntax Expression
        = Expression "?" Expression ":" Expression
        | Expression "||" Expression
        | Expression "&&" Expression
        | Expression Lex_csharp_extra/bar Expression
        | Expression "^" Expression
        | Expression Lex_csharp_extra/ampersand Expression
        | Expression Expression_equality_operator Expression
        | Expression Expression_relational_operator Expression
        | Expression "is" Built_in_type
        | Expression Expression_shift_operator Expression
        | Expression Lex_csharp_extra/plus Expression
        | Expression Lex_csharp_extra/minus Expression
        | Expression "*" Expression
        | Expression "/" Expression
        | Expression "%" Expression
        | Unary_expression
        | Unary_expression Assignment_operator Expression
 ;
syntax Statement
        = Labeled_statement
        | Declaration_statement
        | Embedded_statement
 ;
syntax Embedded_statement
        = Maybe_empty_block
        | Statement_expression ";"
        | Selection_statement
        | Iteration_statement
        | Jump_statement
        | Try_statement
        | "checked" Block
        | "unchecked" Block
        | Lock_statement
        | Using_statement
 ;
syntax Block
        = 
        "{" Statement* "}"
 ;
syntax Labeled_statement
        = 
        Lex_csharp/identifier ":" Statement
 ;
syntax Declaration_statement
        = Local_variable_declaration ";"
        | Local_constant_declaration ";"
 ;
syntax Local_variable_declaration
        = 
        Type 
	    Variable_declarator
	    ","
	  
 ;
syntax Local_constant_declaration
        = 
        "const" Type 
	    Constant_declarator
	    ","
	  
 ;
syntax Constant_declarator
        = 
        Lex_csharp/identifier "=" Expression
 ;
syntax Statement_expression
        = Primary_expression "(" Argument_list ")"
        | "new" Type "(" Argument_list ")"
        | Unary_expression Assignment_operator Expression
        | Primary_expression Increment_decrement
        | Increment_decrement Primary_expression
 ;
syntax Selection_statement
        = If_statement
        | Switch_statement
 ;
syntax If_statement
        = 
        "if" "(" Expression ")" Embedded_statement Else_part?
 ;
syntax Switch_statement
        = 
        "switch" "(" Expression ")" "{" Switch_section* "}"
 ;
syntax Switch_section
        = 
        Switch_label+ Statement+
 ;
syntax Switch_label
        = "case" Expression ":"
        | "default" ":"
 ;
syntax Iteration_statement
        = While_statement
        | Do_statement
        | For_statement
        | Foreach_statement
 ;
syntax While_statement
        = 
        "while" "(" Expression ")" Embedded_statement
 ;
syntax Do_statement
        = 
        "do" Embedded_statement "while" "(" Expression ")" ";"
 ;
syntax For_statement
        = 
        "for" "(" For_initializer? ";" Expression? ";" Statement_expression_list? ")" Embedded_statement
 ;
syntax For_initializer
        = Local_variable_declaration
        | Statement_expression_list
 ;
syntax Statement_expression_list
        = 
        
	Statement_expression
	","
      
 ;
syntax Foreach_statement
        = 
        "foreach" "(" Type Lex_csharp/identifier "in" Expression ")" Embedded_statement
 ;
syntax Jump_statement
        = Break_statement
        | Continue_statement
        | Goto_statement
        | Return_statement
        | Throw_statement
 ;
syntax Break_statement
        = 
        "break" ";"
 ;
syntax Continue_statement
        = 
        "continue" ";"
 ;
syntax Goto_statement
        = "goto" Lex_csharp/identifier ";"
        | "goto" "case" Expression ";"
        | "goto" "default" ";"
 ;
syntax Return_statement
        = 
        "return" Expression? ";"
 ;
syntax Throw_statement
        = 
        "throw" Expression? ";"
 ;
syntax Try_statement
        = "try" Block Catch_clauses Finally_clause?
        | "try" Block Finally_clause
 ;
syntax Catch_clauses
        = Specific_catch_clause+ General_catch_clause?
        | Specific_catch_clause* General_catch_clause
 ;
syntax Specific_catch_clause
        = "catch" "(" Built_in_class_type Lex_csharp/identifier? ")" Block
        | "catch" "(" Qualified_identifier Lex_csharp/identifier? ")" Block
 ;
syntax General_catch_clause
        = 
        "catch" Block
 ;
syntax Finally_clause
        = 
        "finally" Block
 ;
syntax Lock_statement
        = 
        "lock" "(" Expression ")" Embedded_statement
 ;
syntax Using_statement
        = 
        "using" "(" Resource_acquisition ")" Embedded_statement
 ;
syntax Resource_acquisition
        = Local_variable_declaration
        | Expression
 ;
syntax Namespace_declaration
        = 
        "namespace" Qualified_identifier Namespace_body ";"?
 ;
syntax Qualified_identifier
        = 
        
	Lex_csharp/identifier
	"."
      
 ;
syntax Namespace_body
        = 
        "{" Using_directive* Namespace_member_declaration* "}"
 ;
syntax Using_directive
        = 
        "using" (Lex_csharp/identifier "=")? Qualified_identifier ";"
 ;
syntax Namespace_member_declaration
        = Namespace_declaration
        | Type_declaration
 ;
syntax Type_declaration
        = Class_declaration
        | Struct_declaration
        | Interface_declaration
        | Enum_declaration
        | Delegate_declaration
 ;
syntax Class_declaration
        = 
        Attributes Class_modifier* "class" Lex_csharp/identifier Class_base? Class_body ";"?
 ;
syntax Class_modifier
        = "new"
        | "public"
        | "protected"
        | "internal"
        | "private"
        | "abstract"
        | "sealed"
 ;
syntax Class_base
        = ":" Qualified_identifier_list
        | ":" Built_in_class_type ("," Qualified_identifier_list)?
 ;
syntax Class_body
        = 
        "{" Class_member_declaration* "}"
 ;
syntax Class_member_declaration
        = Constant_declaration
        | Field_declaration
        | Method_declaration
        | Property_declaration
        | Event_declaration
        | Indexer_declaration
        | Operator_declaration
        | Constructor_declaration
        | Destructor_declaration
        | Static_constructor_declaration
        | Type_declaration
 ;
syntax Constant_declaration
        = 
        Attributes Constant_modifier* "const" Type 
	    Constant_declarator
	    ","
	   ";"
 ;
syntax Constant_modifier
        = "new"
        | "public"
        | "protected"
        | "internal"
        | "private"
 ;
syntax Field_declaration
        = 
        Attributes Field_modifier* Type 
	    Variable_declarator
	    ","
	   ";"
 ;
syntax Field_modifier
        = "new"
        | "public"
        | "protected"
        | "internal"
        | "private"
        | "static"
        | "readonly"
        | "volatile"
 ;
syntax Variable_declarator
        = Lex_csharp/identifier
        | Lex_csharp/identifier "=" Variable_initializer
 ;
syntax Method_declaration
        = 
        Method_header Maybe_empty_block
 ;
syntax Method_header
        = 
        Attributes Method_modifier* Type_or_void Qualified_identifier "(" Formal_parameter_list? ")"
 ;
syntax Method_modifier
        = "new"
        | "public"
        | "protected"
        | "internal"
        | "private"
        | "static"
        | "virtual"
        | "sealed"
        | "override"
        | "abstract"
        | "extern"
 ;
syntax Type_or_void
        = Type
        | "void"
 ;
syntax Formal_parameter_list
        = Fixed_parameters
        | Fixed_parameters "," Parameter_array
        | Parameter_array
 ;
syntax Fixed_parameters
        = 
        
	Fixed_parameter
	","
      
 ;
syntax Fixed_parameter
        = 
        Attributes Parameter_modifier? Type Lex_csharp/identifier
 ;
syntax Parameter_modifier
        = "ref"
        | "out"
 ;
syntax Parameter_array
        = 
        Attributes "params" Array_type Lex_csharp/identifier
 ;
syntax Property_declaration
        = 
        Attributes Property_modifier* Type Qualified_identifier "{" Accessor_declarations "}"
 ;
syntax Property_modifier
        = "new"
        | "public"
        | "protected"
        | "internal"
        | "private"
        | "static"
        | "virtual"
        | "sealed"
        | "override"
        | "abstract"
        | "extern"
 ;
syntax Accessor_declarations
        = Get_accessor_declaration Set_accessor_declaration?
        | Set_accessor_declaration Get_accessor_declaration?
 ;
syntax Get_accessor_declaration
        = 
        Attributes "get" Maybe_empty_block
 ;
syntax Set_accessor_declaration
        = 
        Attributes "set" Maybe_empty_block
 ;
syntax Event_declaration
        = Attributes Event_modifier* "event" Type 
		Variable_declarator
		","
	       ";"
        | Attributes Event_modifier* "event" Type Qualified_identifier "{" Event_accessor_declarations "}"
 ;
syntax Event_modifier
        = "new"
        | "public"
        | "protected"
        | "internal"
        | "private"
        | "static"
        | "virtual"
        | "sealed"
        | "override"
        | "abstract"
        | "extern"
 ;
syntax Event_accessor_declarations
        = Add_accessor_declaration Remove_accessor_declaration
        | Remove_accessor_declaration Add_accessor_declaration
 ;
syntax Add_accessor_declaration
        = 
        Attributes "add" Block
 ;
syntax Remove_accessor_declaration
        = 
        Attributes "remove" Block
 ;
syntax Indexer_declaration
        = 
        Attributes Indexer_modifier* Indexer_declarator "{" Accessor_declarations "}"
 ;
syntax Indexer_modifier
        = "new"
        | "public"
        | "protected"
        | "internal"
        | "private"
        | "virtual"
        | "sealed"
        | "override"
        | "abstract"
        | "extern"
 ;
syntax Indexer_declarator
        = Type "this" "[" Formal_parameter_list "]"
        | Type Qualified_identifier "." "this" "[" Formal_parameter_list "]"
 ;
syntax Operator_declaration
        = 
        Attributes Operator_modifier+ Operator_declarator Maybe_empty_block
 ;
syntax Operator_modifier
        = "public"
        | "static"
        | "extern"
 ;
syntax Operator_declarator
        = Unary_operator_declarator
        | Binary_operator_declarator
        | Conversion_operator_declarator
 ;
syntax Unary_operator_declarator
        = 
        Type "operator" Overloadable_unary_operator "(" Type Lex_csharp/identifier ")"
 ;
syntax Overloadable_unary_operator
        = Lex_csharp_extra/plus
        | Lex_csharp_extra/minus
        | Increment_decrement
        | "!"
        | "~"
        | "true"
        | "false"
 ;
syntax Binary_operator_declarator
        = 
        Type "operator" Overloadable_binary_operator "(" Type Lex_csharp/identifier "," Type Lex_csharp/identifier ")"
 ;
syntax Overloadable_binary_operator
        = Lex_csharp_extra/plus
        | Lex_csharp_extra/minus
        | "*"
        | "/"
        | "%"
        | Lex_csharp_extra/ampersand
        | Lex_csharp_extra/bar
        | "^"
        | "\<\<"
        | "\>\>"
        | "=="
        | "!="
        | Lex_csharp_extra/greater_than
        | Lex_csharp_extra/less_than
        | "\>="
        | "\<="
 ;
syntax Conversion_operator_declarator
        = 
        Conversion_kind "operator" Type "(" Type Lex_csharp/identifier ")"
 ;
syntax Constructor_declaration
        = 
        Attributes Constructor_modifier* Constructor_declarator Maybe_empty_block
 ;
syntax Constructor_modifier
        = "public"
        | "protected"
        | "internal"
        | "private"
        | "extern"
 ;
syntax Constructor_declarator
        = 
        Lex_csharp/identifier "(" Formal_parameter_list? ")" Constructor_initializer?
 ;
syntax Constructor_initializer
        = ":" "base" "(" Argument_list ")"
        | ":" "this" "(" Argument_list ")"
 ;
syntax Static_constructor_declaration
        = 
        Attributes Static_constructor_modifiers Lex_csharp/identifier "(" ")" Maybe_empty_block
 ;
syntax Static_constructor_modifiers
        = "extern"? "static"
        | "static" "extern"
 ;
syntax Destructor_declaration
        = 
        Attributes "extern"? "~" Lex_csharp/identifier "(" ")" Maybe_empty_block
 ;
syntax Struct_declaration
        = 
        Attributes Struct_modifier* "struct" Lex_csharp/identifier (":" Qualified_identifier_list)? Struct_body ";"?
 ;
syntax Struct_modifier
        = "new"
        | "public"
        | "protected"
        | "internal"
        | "private"
 ;
syntax Struct_body
        = 
        "{" Struct_member_declaration* "}"
 ;
syntax Struct_member_declarations
        = Struct_member_declaration
        | Struct_member_declarations Struct_member_declaration
 ;
syntax Struct_member_declaration
        = Constant_declaration
        | Field_declaration
        | Method_declaration
        | Property_declaration
        | Event_declaration
        | Indexer_declaration
        | Operator_declaration
        | Constructor_declaration
        | Static_constructor_declaration
        | Type_declaration
 ;
syntax Array_type
        = 
        Non_array_type Rank_specifier+
 ;
syntax Non_array_type
        = Qualified_identifier
        | Built_in_type
 ;
syntax Rank_specifier
        = 
        "[" ","* "]"
 ;
syntax Array_initializer
        = "{" "}"
        | "{" 
		Variable_initializer
		","
	       ","? "}"
 ;
syntax Variable_initializer
        = Expression
        | Array_initializer
 ;
syntax Interface_declaration
        = 
        Attributes Interface_modifier* "interface" Lex_csharp/identifier (":" Qualified_identifier_list)? Interface_body ";"?
 ;
syntax Interface_modifier
        = "new"
        | "public"
        | "protected"
        | "internal"
        | "private"
 ;
syntax Interface_body
        = 
        "{" Interface_member_declaration* "}"
 ;
syntax Interface_member_declaration
        = Interface_method_declaration
        | Interface_property_declaration
        | Interface_event_declaration
        | Interface_indexer_declaration
 ;
syntax Interface_method_declaration
        = 
        Attributes "new"? Type_or_void Lex_csharp/identifier "(" Formal_parameter_list? ")" ";"
 ;
syntax Interface_property_declaration
        = 
        Attributes "new"? Type Lex_csharp/identifier "{" Interface_accessors "}"
 ;
syntax Interface_accessors
        = Attributes "get" ";" (Attributes "set" ";")?
        | Attributes "set" ";" (Attributes "get" ";")?
 ;
syntax Interface_event_declaration
        = 
        Attributes "new"? "event" Type Lex_csharp/identifier ";"
 ;
syntax Interface_indexer_declaration
        = 
        Attributes "new"? Type "this" "[" Formal_parameter_list "]" "{" Interface_accessors "}"
 ;
syntax Enum_declaration
        = 
        Attributes Enum_modifier* "enum" Lex_csharp/identifier (":" Integral_type)? Enum_body ";"?
 ;
syntax Enum_body
        = "{" "}"
        | "{" 
		Enum_member_declaration
		","
	       ","? "}"
 ;
syntax Enum_modifier
        = "new"
        | "public"
        | "protected"
        | "internal"
        | "private"
 ;
syntax Enum_member_declaration
        = 
        Attributes Lex_csharp/identifier ("=" Expression)?
 ;
syntax Delegate_declaration
        = 
        Attributes Delegate_modifier* "delegate" Type_or_void Lex_csharp/identifier "(" Formal_parameter_list? ")" ";"
 ;
syntax Delegate_modifier
        = "new"
        | "public"
        | "protected"
        | "internal"
        | "private"
 ;
syntax Global_attributes
        = 
        Global_attribute_section*
 ;
syntax Global_attribute_section
        = 
        "[" "assembly" ":" Attribute_list ","? "]"
 ;
syntax Attributes
        = 
        Attribute_section*
 ;
syntax Attribute_section
        = 
        "[" (Attribute_target ":")? Attribute_list ","? "]"
 ;
syntax Attribute_target
        = "field"
        | "event"
        | "method"
        | "module"
        | "param"
        | "property"
        | "return"
        | "type"
 ;
syntax Attribute_list
        = 
        
	Attribute
	","
      
 ;
syntax Attribute
        = 
        Attribute_name Attribute_arguments?
 ;
syntax Attribute_name
        = 
        Qualified_identifier
 ;
syntax Attribute_arguments
        = 
        "(" Expression_list? ")"
 ;
