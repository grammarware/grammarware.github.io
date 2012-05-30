@contributor{bgf2src automated exporter - SLPS}
module Csharp_ecma_334_4

syntax Compilation_unit
        = 
        Extern_alias_directives? Using_directives? Global_attributes? Namespace_member_declarations?
 ;
syntax Extern_alias_directives
        = Extern_alias_directive
        | Extern_alias_directives Extern_alias_directive
 ;
syntax Extern_alias_directive
        = 
        "extern" "alias" Identifier ";"
 ;
syntax Using_directives
        = Using_directive
        | Using_directives Using_directive
 ;
syntax Using_directive
        = Using_alias_directive
        | Using_namespace_directive
 ;
syntax Using_alias_directive
        = 
        "using" Identifier "=" Namespace_or_type_name ";"
 ;
syntax Namespace_or_type_name
        = Identifier Type_argument_list?
        | Qualified_alias_member
        | Namespace_or_type_name "." Identifier Type_argument_list?
 ;
syntax Type_argument_list
        = 
        "\<" Type_arguments "\>"
 ;
syntax Type_arguments
        = Type_argument
        | Type_arguments "," Type_argument
 ;
syntax Type_argument
        = 
        Type
 ;
syntax Type
        = Value_type
        | Reference_type
        | Type_parameter
 ;
syntax Value_type
        = Struct_type
        | Enum_type
 ;
syntax Struct_type
        = Type_name
        | Simple_type
        | Nullable_type
 ;
syntax Type_name
        = 
        Namespace_or_type_name
 ;
syntax Simple_type
        = Numeric_type
        | "bool"
 ;
syntax Numeric_type
        = Integral_type
        | Floating_point_type
        | "decimal"
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
syntax Floating_point_type
        = "float"
        | "double"
 ;
syntax Nullable_type
        = 
        Non_nullable_value_type "?"
 ;
syntax Non_nullable_value_type
        = Enum_type
        | Type_name
        | Simple_type
 ;
syntax Enum_type
        = 
        Type_name
 ;
syntax Reference_type
        = Class_type
        | Interface_type
        | Array_type
        | Delegate_type
 ;
syntax Class_type
        = Type_name
        | "object"
        | "string"
 ;
syntax Interface_type
        = 
        Type_name
 ;
syntax Array_type
        = 
        Non_array_type Rank_specifiers
 ;
syntax Non_array_type
        = Value_type
        | Class_type
        | Interface_type
        | Delegate_type
        | Type_parameter
 ;
syntax Delegate_type
        = 
        Type_name
 ;
syntax Type_parameter
        = 
        Identifier
 ;
syntax Rank_specifiers
        = Rank_specifier
        | Rank_specifiers Rank_specifier
 ;
syntax Rank_specifier
        = 
        "[" Dim_separators? "]"
 ;
syntax Dim_separators
        = ","
        | Dim_separators ","
 ;
syntax Qualified_alias_member
        = 
        Identifier "::" Identifier Type_argument_list?
 ;
syntax Using_namespace_directive
        = 
        "using" Namespace_name ";"
 ;
syntax Namespace_name
        = 
        Namespace_or_type_name
 ;
syntax Global_attributes
        = 
        Global_attribute_sections
 ;
syntax Global_attribute_sections
        = Global_attribute_section
        | Global_attribute_sections Global_attribute_section
 ;
syntax Global_attribute_section
        = "[" Global_attribute_target_specifier Attribute_list "]"
        | "[" Global_attribute_target_specifier Attribute_list "," "]"
 ;
syntax Global_attribute_target_specifier
        = 
        Global_attribute_target ":"
 ;
syntax Global_attribute_target
        = Identifier
        | Keyword
 ;
syntax Keyword
        = "abstract"
        | "as"
        | "base"
        | "bool"
        | "break"
        | "byte"
        | "case"
        | "catch"
        | "char"
        | "checked"
        | "class"
        | "const"
        | "continue"
        | "decimal"
        | "default"
        | "delegate"
        | "do"
        | "double"
        | "else"
        | "enum"
        | "event"
        | "explicit"
        | "extern"
        | "false"
        | "finally"
        | "fixed"
        | "float"
        | "for"
        | "foreach"
        | "goto"
        | "if"
        | "implicit"
        | "in"
        | "int"
        | "interface"
        | "internal"
        | "is"
        | "lock"
        | "long"
        | "namespace"
        | "new"
        | "null"
        | "object"
        | "operator"
        | "out"
        | "override"
        | "params"
        | "private"
        | "protected"
        | "public"
        | "readonly"
        | "ref"
        | "return"
        | "sbyte"
        | "sealed"
        | "short"
        | "sizeof"
        | "stackalloc"
        | "static"
        | "string"
        | "struct"
        | "switch"
        | "this"
        | "throw"
        | "true"
        | "try"
        | "typeof"
        | "uint"
        | "ulong"
        | "unchecked"
        | "unsafe"
        | "ushort"
        | "using"
        | "virtual"
        | "void"
        | "volatile"
        | "while"
        | "get"
        | "set"
        | "yield"
        | "add"
        | "remove"
        | "alias"
        | "partial"
        | "where"
 ;
syntax Attribute_list
        = Attribute
        | Attribute_list "," Attribute
 ;
syntax Attribute
        = 
        Attribute_name Attribute_arguments?
 ;
syntax Attribute_name
        = 
        Type_name
 ;
syntax Attribute_arguments
        = "(" Positional_argument_list? ")"
        | "(" Positional_argument_list "," Named_argument_list ")"
        | "(" Named_argument_list ")"
 ;
syntax Positional_argument_list
        = Positional_argument
        | Positional_argument_list "," Positional_argument
 ;
syntax Positional_argument
        = 
        Attribute_argument_expression
 ;
syntax Attribute_argument_expression
        = 
        Expression
 ;
syntax Expression
        = Conditional_expression
        | Assignment
 ;
syntax Conditional_expression
        = Null_coalescing_expression
        | Null_coalescing_expression "?" Expression ":" Expression
 ;
syntax Null_coalescing_expression
        = Conditional_or_expression
        | Conditional_or_expression "??" Null_coalescing_expression
 ;
syntax Conditional_or_expression
        = Conditional_and_expression
        | Conditional_or_expression "||" Conditional_and_expression
 ;
syntax Conditional_and_expression
        = Inclusive_or_expression
        | Conditional_and_expression "&&" Inclusive_or_expression
 ;
syntax Inclusive_or_expression
        = Exclusive_or_expression
        | Inclusive_or_expression "|" Exclusive_or_expression
 ;
syntax Exclusive_or_expression
        = And_expression
        | Exclusive_or_expression "^" And_expression
 ;
syntax And_expression
        = Equality_expression
        | And_expression "&" Equality_expression
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
        | Relational_expression "is" Type
        | Relational_expression "as" Type
 ;
syntax Shift_expression
        = Additive_expression
        | Shift_expression "\<\<" Additive_expression
        | Shift_expression Right_shift Additive_expression
 ;
syntax Additive_expression
        = Multiplicative_expression
        | Additive_expression "+" Multiplicative_expression
        | Additive_expression "-" Multiplicative_expression
 ;
syntax Multiplicative_expression
        = Unary_expression
        | Multiplicative_expression "*" Unary_expression
        | Multiplicative_expression "/" Unary_expression
        | Multiplicative_expression "%" Unary_expression
 ;
syntax Unary_expression
        = Primary_expression
        | "+" Unary_expression
        | "-" Unary_expression
        | "!" Unary_expression
        | "~" Unary_expression
        | Pre_increment_expression
        | Pre_decrement_expression
        | Cast_expression
 ;
syntax Primary_expression
        = Array_creation_expression
        | Primary_no_array_creation_expression
 ;
syntax Array_creation_expression
        = "new" Non_array_type "[" Expression_list "]" Rank_specifiers? Array_initializer?
        | "new" Array_type Array_initializer
 ;
syntax Expression_list
        = Expression
        | Expression_list "," Expression
 ;
syntax Array_initializer
        = "{" Variable_initializer_list? "}"
        | "{" Variable_initializer_list "," "}"
 ;
syntax Variable_initializer_list
        = Variable_initializer
        | Variable_initializer_list "," Variable_initializer
 ;
syntax Variable_initializer
        = Expression
        | Array_initializer
 ;
syntax Primary_no_array_creation_expression
        = Literal
        | Simple_name
        | Parenthesized_expression
        | Member_access
        | Invocation_expression
        | Element_access
        | This_access
        | Base_access
        | Post_increment_expression
        | Post_decrement_expression
        | Object_creation_expression
        | Delegate_creation_expression
        | Typeof_expression
        | Checked_expression
        | Unchecked_expression
        | Default_value_expression
        | Anonymous_method_expression
 ;
syntax Simple_name
        = 
        Identifier Type_argument_list?
 ;
syntax Parenthesized_expression
        = 
        "(" Expression ")"
 ;
syntax Member_access
        = Primary_expression "." Identifier Type_argument_list?
        | Predefined_type "." Identifier Type_argument_list?
        | Qualified_alias_member "." Identifier Type_argument_list?
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
syntax Invocation_expression
        = 
        Primary_expression "(" Argument_list? ")"
 ;
syntax Argument_list
        = Argument
        | Argument_list "," Argument
 ;
syntax Argument
        = Expression
        | "ref" Variable_reference
        | "out" Variable_reference
 ;
syntax Variable_reference
        = 
        Expression
 ;
syntax Element_access
        = 
        Primary_no_array_creation_expression "[" Expression_list "]"
 ;
syntax This_access
        = 
        "this"
 ;
syntax Base_access
        = "base" "." Identifier Type_argument_list?
        | "base" "[" Expression_list "]"
 ;
syntax Post_increment_expression
        = 
        Primary_expression "++"
 ;
syntax Post_decrement_expression
        = 
        Primary_expression "--"
 ;
syntax Object_creation_expression
        = 
        "new" Type "(" Argument_list? ")"
 ;
syntax Delegate_creation_expression
        = 
        "new" Delegate_type "(" Expression ")"
 ;
syntax Typeof_expression
        = "typeof" "(" Type ")"
        | "typeof" "(" Unbound_type_name ")"
        | "typeof" "(" "void" ")"
 ;
syntax Unbound_type_name
        = Identifier Generic_dimension_specifier?
        | Identifier "::" Identifier Generic_dimension_specifier?
        | Unbound_type_name "." Identifier Generic_dimension_specifier?
 ;
syntax Generic_dimension_specifier
        = 
        "\<" Commas? "\>"
 ;
syntax Commas
        = ","
        | Commas ","
 ;
syntax Checked_expression
        = 
        "checked" "(" Expression ")"
 ;
syntax Unchecked_expression
        = 
        "unchecked" "(" Expression ")"
 ;
syntax Default_value_expression
        = 
        "default" "(" Type ")"
 ;
syntax Anonymous_method_expression
        = 
        "delegate" Anonymous_method_signature? Block
 ;
syntax Anonymous_method_signature
        = 
        "(" Anonymous_method_parameter_list? ")"
 ;
syntax Anonymous_method_parameter_list
        = Anonymous_method_parameter
        | Anonymous_method_parameter_list "," Anonymous_method_parameter
 ;
syntax Anonymous_method_parameter
        = 
        Parameter_modifier? Type Identifier
 ;
syntax Parameter_modifier
        = "ref"
        | "out"
 ;
syntax Block
        = 
        "{" Statement_list? "}"
 ;
syntax Statement_list
        = Statement
        | Statement_list Statement
 ;
syntax Statement
        = Labeled_statement
        | Declaration_statement
        | Embedded_statement
 ;
syntax Labeled_statement
        = 
        Identifier ":" Statement
 ;
syntax Declaration_statement
        = Local_variable_declaration ";"
        | Local_constant_declaration ";"
 ;
syntax Local_variable_declaration
        = 
        Type Local_variable_declarators
 ;
syntax Local_variable_declarators
        = Local_variable_declarator
        | Local_variable_declarators "," Local_variable_declarator
 ;
syntax Local_variable_declarator
        = Identifier
        | Identifier "=" Local_variable_initializer
 ;
syntax Local_variable_initializer
        = Expression
        | Array_initializer
 ;
syntax Local_constant_declaration
        = 
        "const" Type Constant_declarators
 ;
syntax Constant_declarators
        = Constant_declarator
        | Constant_declarators "," Constant_declarator
 ;
syntax Constant_declarator
        = 
        Identifier "=" Constant_expression
 ;
syntax Constant_expression
        = 
        Expression
 ;
syntax Embedded_statement
        = Block
        | Empty_statement
        | Expression_statement
        | Selection_statement
        | Iteration_statement
        | Jump_statement
        | Try_statement
        | Checked_statement
        | Unchecked_statement
        | Lock_statement
        | Using_statement
        | Yield_statement
 ;
syntax Empty_statement
        = 
        ";"
 ;
syntax Expression_statement
        = 
        Statement_expression ";"
 ;
syntax Statement_expression
        = Invocation_expression
        | Object_creation_expression
        | Assignment
        | Post_increment_expression
        | Post_decrement_expression
        | Pre_increment_expression
        | Pre_decrement_expression
 ;
syntax Assignment
        = 
        Unary_expression Assignment_operator Expression
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
        | Right_shift_assignment
 ;
syntax Right_shift_assignment
        = 
        "\>\>="
 ;
syntax Pre_increment_expression
        = 
        "++" Unary_expression
 ;
syntax Pre_decrement_expression
        = 
        "--" Unary_expression
 ;
syntax Selection_statement
        = If_statement
        | Switch_statement
 ;
syntax If_statement
        = "if" "(" Boolean_expression ")" Embedded_statement
        | "if" "(" Boolean_expression ")" Embedded_statement "else" Embedded_statement
 ;
syntax Boolean_expression
        = 
        Expression
 ;
syntax Switch_statement
        = 
        "switch" "(" Expression ")" Switch_block
 ;
syntax Switch_block
        = 
        "{" Switch_sections? "}"
 ;
syntax Switch_sections
        = Switch_section
        | Switch_sections Switch_section
 ;
syntax Switch_section
        = 
        Switch_labels Statement_list
 ;
syntax Switch_labels
        = Switch_label
        | Switch_labels Switch_label
 ;
syntax Switch_label
        = "case" Constant_expression ":"
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
        "while" "(" Boolean_expression ")" Embedded_statement
 ;
syntax Do_statement
        = 
        "do" Embedded_statement "while" "(" Boolean_expression ")" ";"
 ;
syntax For_statement
        = 
        "for" "(" For_initializer? ";" For_condition? ";" For_iterator? ")" Embedded_statement
 ;
syntax For_initializer
        = Local_variable_declaration
        | Statement_expression_list
 ;
syntax Statement_expression_list
        = Statement_expression
        | Statement_expression_list "," Statement_expression
 ;
syntax For_condition
        = 
        Boolean_expression
 ;
syntax For_iterator
        = 
        Statement_expression_list
 ;
syntax Foreach_statement
        = 
        "foreach" "(" Type Identifier "in" Expression ")" Embedded_statement
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
        = "goto" Identifier ";"
        | "goto" "case" Constant_expression ";"
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
        = "try" Block Catch_clauses
        | "try" Block Catch_clauses? Finally_clause
 ;
syntax Catch_clauses
        = Specific_catch_clauses
        | Specific_catch_clauses? General_catch_clause
 ;
syntax Specific_catch_clauses
        = Specific_catch_clause
        | Specific_catch_clauses Specific_catch_clause
 ;
syntax Specific_catch_clause
        = 
        "catch" "(" Class_type Identifier? ")" Block
 ;
syntax General_catch_clause
        = 
        "catch" Block
 ;
syntax Finally_clause
        = 
        "finally" Block
 ;
syntax Checked_statement
        = 
        "checked" Block
 ;
syntax Unchecked_statement
        = 
        "unchecked" Block
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
syntax Yield_statement
        = "yield" "return" Expression ";"
        | "yield" "break" ";"
 ;
syntax Cast_expression
        = 
        "(" Type ")" Unary_expression
 ;
syntax Right_shift
        = 
        "\>\>"
 ;
syntax Named_argument_list
        = Named_argument
        | Named_argument_list "," Named_argument
 ;
syntax Named_argument
        = 
        Identifier "=" Attribute_argument_expression
 ;
syntax Namespace_member_declarations
        = Namespace_member_declaration
        | Namespace_member_declarations Namespace_member_declaration
 ;
syntax Namespace_member_declaration
        = Namespace_declaration
        | Type_declaration
 ;
syntax Namespace_declaration
        = 
        "namespace" Qualified_identifier Namespace_body ";"?
 ;
syntax Qualified_identifier
        = Identifier
        | Qualified_identifier "." Identifier
 ;
syntax Namespace_body
        = 
        "{" Extern_alias_directives? Using_directives? Namespace_member_declarations? "}"
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
        Attributes? Class_modifiers? "partial"? "class" Identifier Type_parameter_list? Class_base? Type_parameter_constraints_clauses? Class_body ";"?
 ;
syntax Attributes
        = 
        Attribute_sections
 ;
syntax Attribute_sections
        = Attribute_section
        | Attribute_sections Attribute_section
 ;
syntax Attribute_section
        = "[" Attribute_target_specifier? Attribute_list "]"
        | "[" Attribute_target_specifier? Attribute_list "," "]"
 ;
syntax Attribute_target_specifier
        = 
        Attribute_target ":"
 ;
syntax Attribute_target
        = Identifier
        | Keyword
 ;
syntax Class_modifiers
        = Class_modifier
        | Class_modifiers Class_modifier
 ;
syntax Class_modifier
        = "new"
        | "public"
        | "protected"
        | "internal"
        | "private"
        | "abstract"
        | "sealed"
        | "static"
 ;
syntax Type_parameter_list
        = 
        "\<" Type_parameters "\>"
 ;
syntax Type_parameters
        = Attributes? Type_parameter
        | Type_parameters "," Attributes? Type_parameter
 ;
syntax Class_base
        = ":" Class_type
        | ":" Interface_type_list
        | ":" Class_type "," Interface_type_list
 ;
syntax Interface_type_list
        = Interface_type
        | Interface_type_list "," Interface_type
 ;
syntax Type_parameter_constraints_clauses
        = Type_parameter_constraints_clause
        | Type_parameter_constraints_clauses Type_parameter_constraints_clause
 ;
syntax Type_parameter_constraints_clause
        = 
        "where" Type_parameter ":" Type_parameter_constraints
 ;
syntax Type_parameter_constraints
        = Primary_constraint
        | Secondary_constraints
        | Constructor_constraint
        | Primary_constraint "," Secondary_constraints
        | Primary_constraint "," Constructor_constraint
        | Secondary_constraints "," Constructor_constraint
        | Primary_constraint "," Secondary_constraints "," Constructor_constraint
 ;
syntax Primary_constraint
        = Class_type
        | "class"
        | "struct"
 ;
syntax Secondary_constraints
        = Interface_type
        | Type_parameter
        | Secondary_constraints "," Interface_type
        | Secondary_constraints "," Type_parameter
 ;
syntax Constructor_constraint
        = 
        "new" "(" ")"
 ;
syntax Class_body
        = 
        "{" Class_member_declarations? "}"
 ;
syntax Class_member_declarations
        = Class_member_declaration
        | Class_member_declarations Class_member_declaration
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
        | Finalizer_declaration
        | Static_constructor_declaration
        | Type_declaration
 ;
syntax Constant_declaration
        = 
        Attributes? Constant_modifiers? "const" Type Constant_declarators ";"
 ;
syntax Constant_modifiers
        = Constant_modifier
        | Constant_modifiers Constant_modifier
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
        Attributes? Field_modifiers? Type Variable_declarators ";"
 ;
syntax Field_modifiers
        = Field_modifier
        | Field_modifiers Field_modifier
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
syntax Variable_declarators
        = Variable_declarator
        | Variable_declarators "," Variable_declarator
 ;
syntax Variable_declarator
        = Identifier
        | Identifier "=" Variable_initializer
 ;
syntax Method_declaration
        = 
        Method_header Method_body
 ;
syntax Method_header
        = 
        Attributes? Method_modifiers? Return_type Member_name Type_parameter_list? "(" Formal_parameter_list? ")" Type_parameter_constraints_clauses?
 ;
syntax Method_modifiers
        = Method_modifier
        | Method_modifiers Method_modifier
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
syntax Return_type
        = Type
        | "void"
 ;
syntax Member_name
        = Identifier
        | Interface_type "." Identifier
 ;
syntax Formal_parameter_list
        = Fixed_parameters
        | Fixed_parameters "," Parameter_array
        | Parameter_array
 ;
syntax Fixed_parameters
        = Fixed_parameter
        | Fixed_parameters "," Fixed_parameter
 ;
syntax Fixed_parameter
        = 
        Attributes? Parameter_modifier? Type Identifier
 ;
syntax Parameter_array
        = 
        Attributes? "params" Array_type Identifier
 ;
syntax Method_body
        = Block
        | ";"
 ;
syntax Property_declaration
        = 
        Attributes? Property_modifiers? Type Member_name "{" Accessor_declarations "}"
 ;
syntax Property_modifiers
        = Property_modifier
        | Property_modifiers Property_modifier
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
        Attributes? Accessor_modifier? "get" Accessor_body
 ;
syntax Accessor_modifier
        = "protected"
        | "internal"
        | "private"
        | "protected" "internal"
        | "internal" "protected"
 ;
syntax Accessor_body
        = Block
        | ";"
 ;
syntax Set_accessor_declaration
        = 
        Attributes? Accessor_modifier? "set" Accessor_body
 ;
syntax Event_declaration
        = Attributes? Event_modifiers? "event" Type Variable_declarators ";"
        | Attributes? Event_modifiers? "event" Type Member_name "{" Event_accessor_declarations "}"
 ;
syntax Event_modifiers
        = Event_modifier
        | Event_modifiers Event_modifier
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
        Attributes? "add" Block
 ;
syntax Remove_accessor_declaration
        = 
        Attributes? "remove" Block
 ;
syntax Indexer_declaration
        = 
        Attributes? Indexer_modifiers? Indexer_declarator "{" Accessor_declarations "}"
 ;
syntax Indexer_modifiers
        = Indexer_modifier
        | Indexer_modifiers Indexer_modifier
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
        | Type Interface_type "." "this" "[" Formal_parameter_list "]"
 ;
syntax Operator_declaration
        = 
        Attributes? Operator_modifiers Operator_declarator Operator_body
 ;
syntax Operator_modifiers
        = Operator_modifier
        | Operator_modifiers Operator_modifier
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
        Type "operator" Overloadable_unary_operator "(" Type Identifier ")"
 ;
syntax Overloadable_unary_operator
        = "+"
        | "-"
        | "!"
        | "~"
        | "++"
        | "--"
        | "true"
        | "false"
 ;
syntax Binary_operator_declarator
        = 
        Type "operator" Overloadable_binary_operator "(" Type Identifier "," Type Identifier ")"
 ;
syntax Overloadable_binary_operator
        = "+"
        | "-"
        | "*"
        | "/"
        | "%"
        | "&"
        | "|"
        | "^"
        | "\<\<"
        | Right_shift
        | "=="
        | "!="
        | "\>"
        | "\<"
        | "\>="
        | "\<="
 ;
syntax Conversion_operator_declarator
        = "implicit" "operator" Type "(" Type Identifier ")"
        | "explicit" "operator" Type "(" Type Identifier ")"
 ;
syntax Operator_body
        = Block
        | ";"
 ;
syntax Constructor_declaration
        = 
        Attributes? Constructor_modifiers? Constructor_declarator Constructor_body
 ;
syntax Constructor_modifiers
        = Constructor_modifier
        | Constructor_modifiers Constructor_modifier
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
        Identifier "(" Formal_parameter_list? ")" Constructor_initializer?
 ;
syntax Constructor_initializer
        = ":" "base" "(" Argument_list? ")"
        | ":" "this" "(" Argument_list? ")"
 ;
syntax Constructor_body
        = Block
        | ";"
 ;
syntax Finalizer_declaration
        = 
        Attributes? "extern"? "~" Identifier "(" ")" Finalizer_body
 ;
syntax Finalizer_body
        = Block
        | ";"
 ;
syntax Static_constructor_declaration
        = 
        Attributes? Static_constructor_modifiers Identifier "(" ")" Static_constructor_body
 ;
syntax Static_constructor_modifiers
        = "extern"? "static"
        | "static" "extern"?
 ;
syntax Static_constructor_body
        = Block
        | ";"
 ;
syntax Struct_declaration
        = 
        Attributes? Struct_modifiers? "partial"? "struct" Identifier Type_parameter_list? Struct_interfaces? Type_parameter_constraints_clauses? Struct_body ";"?
 ;
syntax Struct_modifiers
        = Struct_modifier
        | Struct_modifiers Struct_modifier
 ;
syntax Struct_modifier
        = "new"
        | "public"
        | "protected"
        | "internal"
        | "private"
 ;
syntax Struct_interfaces
        = 
        ":" Interface_type_list
 ;
syntax Struct_body
        = 
        "{" Struct_member_declarations? "}"
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
syntax Interface_declaration
        = 
        Attributes? Interface_modifiers? "partial"? "interface" Identifier Type_parameter_list? Interface_base? Type_parameter_constraints_clauses? Interface_body ";"?
 ;
syntax Interface_modifiers
        = Interface_modifier
        | Interface_modifiers Interface_modifier
 ;
syntax Interface_modifier
        = "new"
        | "public"
        | "protected"
        | "internal"
        | "private"
 ;
syntax Interface_base
        = 
        ":" Interface_type_list
 ;
syntax Interface_body
        = 
        "{" Interface_member_declarations? "}"
 ;
syntax Interface_member_declarations
        = Interface_member_declaration
        | Interface_member_declarations Interface_member_declaration
 ;
syntax Interface_member_declaration
        = Interface_method_declaration
        | Interface_property_declaration
        | Interface_event_declaration
        | Interface_indexer_declaration
 ;
syntax Interface_method_declaration
        = 
        Attributes? "new"? Return_type Identifier Type_parameter_list? "(" Formal_parameter_list? ")" Type_parameter_constraints_clauses? ";"
 ;
syntax Interface_property_declaration
        = 
        Attributes? "new"? Type Identifier "{" Interface_accessors "}"
 ;
syntax Interface_accessors
        = Attributes? "get" ";"
        | Attributes? "set" ";"
        | Attributes? "get" ";" Attributes? "set" ";"
        | Attributes? "set" ";" Attributes? "get" ";"
 ;
syntax Interface_event_declaration
        = 
        Attributes? "new"? "event" Type Identifier ";"
 ;
syntax Interface_indexer_declaration
        = 
        Attributes? "new"? Type "this" "[" Formal_parameter_list "]" "{" Interface_accessors "}"
 ;
syntax Enum_declaration
        = 
        Attributes? Enum_modifiers? "enum" Identifier Enum_base? Enum_body ";"?
 ;
syntax Enum_modifiers
        = Enum_modifier
        | Enum_modifiers Enum_modifier
 ;
syntax Enum_modifier
        = "new"
        | "public"
        | "protected"
        | "internal"
        | "private"
 ;
syntax Enum_base
        = 
        ":" Integral_type
 ;
syntax Enum_body
        = "{" Enum_member_declarations? "}"
        | "{" Enum_member_declarations "," "}"
 ;
syntax Enum_member_declarations
        = Enum_member_declaration
        | Enum_member_declarations "," Enum_member_declaration
 ;
syntax Enum_member_declaration
        = Attributes? Identifier
        | Attributes? Identifier "=" Constant_expression
 ;
syntax Delegate_declaration
        = 
        Attributes? Delegate_modifiers? "delegate" Return_type Identifier Type_parameter_list? "(" Formal_parameter_list? ")" Type_parameter_constraints_clauses? ";"
 ;
syntax Delegate_modifiers
        = Delegate_modifier
        | Delegate_modifiers Delegate_modifier
 ;
syntax Delegate_modifier
        = "new"
        | "public"
        | "protected"
        | "internal"
        | "private"
 ;
