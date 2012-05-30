@contributor{bgf2src automated exporter - SLPS}
module Iso_14882_1998

syntax Translation_unit
        = 
        Declaration_seq?
 ;
syntax Primary_expression
        = 
        Literal "this" "(" Expression ")" Id_expression
 ;
syntax Id_expression
        = 
        Unqualified_id Qualified_id
 ;
syntax Unqualified_id
        = 
        Identifier Operator_function_id Conversion_function_id "~" Class_name Template_id
 ;
syntax Qualified_id
        = 
        "::"? Nested_name_specifier "template"? Unqualified_id "::" Identifier "::" Operator_function_id "::" Template_id
 ;
syntax Nested_name_specifier
        = 
        Class_or_namespace_name "::" Nested_name_specifier? Class_or_namespace_name "::" "template" Nested_name_specifier
 ;
syntax Class_or_namespace_name
        = 
        Class_name Namespace_name
 ;
syntax Postfix_expression
        = 
        Primary_expression Postfix_expression "[" Expression "]" Postfix_expression "(" Expression_list? ")" Simple_type_specifier "(" Expression_list? ")" "typename" "::"? Nested_name_specifier Identifier "(" Expression_list? ")" "typename" "::"? Nested_name_specifier "template"? Template_id "(" Expression_list? ")" Postfix_expression "." "template"? Id_expression Postfix_expression "-\>" "template"? Id_expression Postfix_expression "." Pseudo_destructor_name Postfix_expression "-\>" Pseudo_destructor_name Postfix_expression "++" Postfix_expression "--" "dynamic_cast" "\<" Type_id "\>" "(" Expression ")" "static_cast" "\<" Type_id "\>" "(" Expression ")" "reinterpret_cast" "\<" Type_id "\>" "(" Expression ")" "const_cast" "\<" Type_id "\>" "(" Expression ")" "typeid" "(" Expression ")" "typeid" "(" Type_id ")"
 ;
syntax Expression_list
        = 
        Assignment_expression Expression_list "," Assignment_expression
 ;
syntax Pseudo_destructor_name
        = 
        "::"? Nested_name_specifier? Type_name "::" "~" Type_name "::"? Nested_name_specifier "template" Template_id "::" "~" Type_name "::"? Nested_name_specifier? "~" Type_name
 ;
syntax Unary_expression
        = 
        Postfix_expression "++" Cast_expression "--" Cast_expression Unary_operator Cast_expression "sizeof" Unary_expression "sizeof" "(" Type_id ")" New_expression Delete_expression
 ;
syntax Unary_operator
        = "*"
        | "&"
        | "+"
        | "-"
        | "!"
        | "~"
 ;
syntax New_expression
        = 
        "::"? "new" New_placement? New_type_id New_initializer? "::"? "new" New_placement? "(" Type_id ")" New_initializer?
 ;
syntax New_placement
        = 
        "(" Expression_list ")"
 ;
syntax New_type_id
        = 
        Type_specifier_seq New_declarator?
 ;
syntax New_declarator
        = 
        Ptr_operator New_declarator? Direct_new_declarator
 ;
syntax Direct_new_declarator
        = 
        "[" Expression "]" Direct_new_declarator "[" Constant_expression "]"
 ;
syntax New_initializer
        = 
        "(" Expression_list? ")"
 ;
syntax Delete_expression
        = 
        "::"? "delete" Cast_expression "::"? "delete" "[" "]" Cast_expression
 ;
syntax Cast_expression
        = 
        Unary_expression "(" Type_id ")" Cast_expression
 ;
syntax Pm_expression
        = 
        Cast_expression Pm_expression ".*" Cast_expression Pm_expression "-\>*" Cast_expression
 ;
syntax Multiplicative_expression
        = 
        Pm_expression Multiplicative_expression "*" Pm_expression Multiplicative_expression "/" Pm_expression Multiplicative_expression "%" Pm_expression
 ;
syntax Additive_expression
        = 
        Multiplicative_expression Additive_expression "+" Multiplicative_expression Additive_expression "-" Multiplicative_expression
 ;
syntax Shift_expression
        = 
        Additive_expression Shift_expression "\<\<" Additive_expression Shift_expression "\>\>" Additive_expression
 ;
syntax Relational_expression
        = 
        Shift_expression Relational_expression "\<" Shift_expression Relational_expression "\>" Shift_expression Relational_expression "\<=" Shift_expression Relational_expression "\>=" Shift_expression
 ;
syntax Equality_expression
        = 
        Relational_expression Equality_expression "==" Relational_expression Equality_expression "!=" Relational_expression
 ;
syntax And_expression
        = 
        Equality_expression And_expression "&" Equality_expression
 ;
syntax Exclusive_or_expression
        = 
        And_expression Exclusive_or_expression "^" And_expression
 ;
syntax Inclusive_or_expression
        = 
        Exclusive_or_expression Inclusive_or_expression "|" Exclusive_or_expression
 ;
syntax Logical_and_expression
        = 
        Inclusive_or_expression Logical_and_expression "&&" Inclusive_or_expression
 ;
syntax Logical_or_expression
        = 
        Logical_and_expression Logical_or_expression "||" Logical_and_expression
 ;
syntax Conditional_expression
        = 
        Logical_or_expression Logical_or_expression "?" Expression ":" Assignment_expression
 ;
syntax Assignment_expression
        = 
        Conditional_expression Logical_or_expression Assignment_operator Assignment_expression Throw_expression
 ;
syntax Assignment_operator
        = "="
        | "*="
        | "/="
        | "%="
        | "+="
        | "-="
        | "\>\>="
        | "\<\<="
        | "&="
        | "^="
        | "|="
 ;
syntax Expression
        = 
        Assignment_expression Expression "," Assignment_expression
 ;
syntax Constant_expression
        = 
        Conditional_expression
 ;
syntax Statement
        = 
        Labeled_statement Expression_statement Compound_statement Selection_statement Iteration_statement Jump_statement Declaration_statement Try_block
 ;
syntax Labeled_statement
        = 
        Identifier ":" Statement "case" Constant_expression ":" Statement "default" ":" Statement
 ;
syntax Expression_statement
        = 
        Expression? ";"
 ;
syntax Compound_statement
        = 
        "{" Statement_seq? "}"
 ;
syntax Statement_seq
        = 
        Statement Statement_seq Statement
 ;
syntax Selection_statement
        = 
        "if" "(" Condition ")" Statement "if" "(" Condition ")" Statement "else" Statement "switch" "(" Condition ")" Statement
 ;
syntax Condition
        = 
        Expression Type_specifier_seq Declarator "=" Assignment_expression
 ;
syntax Iteration_statement
        = 
        "while" "(" Condition ")" Statement "do" Statement "while" "(" Expression ")" ";" "for" "(" For_init_statement Condition? ";" Expression? ")" Statement
 ;
syntax For_init_statement
        = 
        Expression_statement Simple_declaration
 ;
syntax Jump_statement
        = 
        "break" ";" "continue" ";" "return" Expression? ";" "goto" Identifier ";"
 ;
syntax Declaration_statement
        = 
        Block_declaration
 ;
syntax Declaration_seq
        = 
        Declaration Declaration_seq Declaration
 ;
syntax Declaration
        = 
        Block_declaration Function_definition Template_declaration Explicit_instantiation Explicit_specialization Linkage_specification Namespace_definition
 ;
syntax Block_declaration
        = 
        Simple_declaration Asm_definition Namespace_alias_definition Using_declaration Using_directive
 ;
syntax Simple_declaration
        = 
        Decl_specifier_seq? Init_declarator_list? ";"
 ;
syntax Decl_specifier
        = 
        Storage_class_specifier Type_specifier Function_specifier "friend" "typedef"
 ;
syntax Decl_specifier_seq
        = 
        Decl_specifier_seq? Decl_specifier
 ;
syntax Storage_class_specifier
        = 
        "auto" "register" "static" "extern" "mutable"
 ;
syntax Function_specifier
        = 
        "inline" "virtual" "explicit"
 ;
syntax Typedef_name
        = 
        Identifier
 ;
syntax Type_specifier
        = 
        Simple_type_specifier Class_specifier Enum_specifier Elaborated_type_specifier Cv_qualifier
 ;
syntax Simple_type_specifier
        = 
        "::"? Nested_name_specifier? Type_name "::"? Nested_name_specifier "template" Template_id "char" "wchar_t" "bool" "short" "int" "long" "signed" "unsigned" "float" "double" "void"
 ;
syntax Type_name
        = 
        Class_name Enum_name Typedef_name
 ;
syntax Elaborated_type_specifier
        = 
        Class_key "::"? Nested_name_specifier? Identifier "enum" "::"? Nested_name_specifier? Identifier "typename" "::"? Nested_name_specifier Identifier "typename" "::"? Nested_name_specifier "template"? Template_id
 ;
syntax Enum_name
        = 
        Identifier
 ;
syntax Enum_specifier
        = 
        "enum" Identifier? "{" Enumerator_list? "}"
 ;
syntax Enumerator_list
        = 
        Enumerator_definition Enumerator_list "," Enumerator_definition
 ;
syntax Enumerator_definition
        = 
        Enumerator Enumerator "=" Constant_expression
 ;
syntax Enumerator
        = 
        Identifier
 ;
syntax Namespace_name
        = 
        Original_namespace_name Namespace_alias
 ;
syntax Original_namespace_name
        = 
        Identifier
 ;
syntax Namespace_definition
        = 
        Named_namespace_definition Unnamed_namespace_definition
 ;
syntax Named_namespace_definition
        = 
        Original_namespace_definition Extension_namespace_definition
 ;
syntax Original_namespace_definition
        = 
        "namespace" Identifier "{" Namespace_body "}"
 ;
syntax Extension_namespace_definition
        = 
        "namespace" Original_namespace_name "{" Namespace_body "}"
 ;
syntax Unnamed_namespace_definition
        = 
        "namespace" "{" Namespace_body "}"
 ;
syntax Namespace_body
        = 
        Declaration_seq?
 ;
syntax Namespace_alias
        = 
        Identifier
 ;
syntax Namespace_alias_definition
        = 
        "namespace" Identifier "=" Qualified_namespace_specifier ";"
 ;
syntax Qualified_namespace_specifier
        = 
        "::"? Nested_name_specifier? Namespace_name
 ;
syntax Using_declaration
        = 
        "using" "typename"? "::"? Nested_name_specifier Unqualified_id ";" "using" "::" Unqualified_id ";"
 ;
syntax Using_directive
        = 
        "using" "namespace" "::"? Nested_name_specifier? Namespace_name ";"
 ;
syntax Asm_definition
        = 
        "asm" "(" String_literal ")" ";"
 ;
syntax Linkage_specification
        = 
        "extern" String_literal "{" Declaration_seq? "}" "extern" String_literal Declaration
 ;
syntax Init_declarator_list
        = 
        Init_declarator Init_declarator_list "," Init_declarator
 ;
syntax Init_declarator
        = 
        Declarator Initializer?
 ;
syntax Declarator
        = 
        Direct_declarator Ptr_operator Declarator
 ;
syntax Direct_declarator
        = 
        Declarator_id Direct_declarator "(" Parameter_declaration_clause ")" Cv_qualifier_seq? Exception_specification? Direct_declarator "[" Constant_expression? "]" "(" Declarator ")"
 ;
syntax Ptr_operator
        = 
        "*" Cv_qualifier_seq? "&" "::"? Nested_name_specifier "*" Cv_qualifier_seq?
 ;
syntax Cv_qualifier_seq
        = 
        Cv_qualifier Cv_qualifier_seq?
 ;
syntax Cv_qualifier
        = 
        "const" "volatile"
 ;
syntax Declarator_id
        = 
        Id_expression "::"? Nested_name_specifier? Type_name
 ;
syntax Type_id
        = 
        Type_specifier_seq Abstract_declarator?
 ;
syntax Type_specifier_seq
        = 
        Type_specifier Type_specifier_seq?
 ;
syntax Abstract_declarator
        = 
        Ptr_operator Abstract_declarator? Direct_abstract_declarator
 ;
syntax Direct_abstract_declarator
        = 
        Direct_abstract_declarator? "(" Parameter_declaration_clause ")" Cv_qualifier_seq? Exception_specification? Direct_abstract_declarator? "[" Constant_expression? "]" "(" Abstract_declarator ")"
 ;
syntax Parameter_declaration_clause
        = 
        Parameter_declaration_list? "..."? Parameter_declaration_list "," "..."
 ;
syntax Parameter_declaration_list
        = 
        Parameter_declaration Parameter_declaration_list "," Parameter_declaration
 ;
syntax Parameter_declaration
        = 
        Decl_specifier_seq Declarator Decl_specifier_seq Declarator "=" Assignment_expression Decl_specifier_seq Abstract_declarator? Decl_specifier_seq Abstract_declarator? "=" Assignment_expression
 ;
syntax Function_definition
        = 
        Decl_specifier_seq? Declarator Ctor_initializer? Function_body Decl_specifier_seq? Declarator Function_try_block
 ;
syntax Function_body
        = 
        Compound_statement
 ;
syntax Initializer
        = 
        "=" Initializer_clause "(" Expression_list ")"
 ;
syntax Initializer_clause
        = 
        Assignment_expression "{" Initializer_list ","? "}" "{" "}"
 ;
syntax Initializer_list
        = 
        Initializer_clause Initializer_list "," Initializer_clause
 ;
syntax Class_name
        = 
        Identifier Template_id
 ;
syntax Class_specifier
        = 
        Class_head "{" Member_specification? "}"
 ;
syntax Class_head
        = 
        Class_key Identifier? Base_clause? Class_key Nested_name_specifier Identifier Base_clause? Class_key Nested_name_specifier? Template_id Base_clause?
 ;
syntax Class_key
        = 
        "class" "struct" "union"
 ;
syntax Member_specification
        = 
        Member_declaration Member_specification? Access_specifier ":" Member_specification?
 ;
syntax Member_declaration
        = 
        Decl_specifier_seq? Member_declarator_list? ";" Function_definition ";"? "::"? Nested_name_specifier "template"? Unqualified_id ";" Using_declaration Template_declaration
 ;
syntax Member_declarator_list
        = 
        Member_declarator Member_declarator_list "," Member_declarator
 ;
syntax Member_declarator
        = 
        Declarator Pure_specifier? Declarator Constant_initializer? Identifier? ":" Constant_expression
 ;
syntax Pure_specifier
        = 
        "=" "0"
 ;
syntax Constant_initializer
        = 
        "=" Constant_expression
 ;
syntax Base_clause
        = 
        ":" Base_specifier_list
 ;
syntax Base_specifier_list
        = 
        Base_specifier Base_specifier_list "," Base_specifier
 ;
syntax Base_specifier
        = 
        "::"? Nested_name_specifier? Class_name "virtual" Access_specifier? "::"? Nested_name_specifier? Class_name Access_specifier "virtual"? "::"? Nested_name_specifier? Class_name
 ;
syntax Access_specifier
        = 
        "private" "protected" "public"
 ;
syntax Conversion_function_id
        = 
        "operator" Conversion_type_id
 ;
syntax Conversion_type_id
        = 
        Type_specifier_seq Conversion_declarator?
 ;
syntax Conversion_declarator
        = 
        Ptr_operator Conversion_declarator?
 ;
syntax Ctor_initializer
        = 
        ":" Mem_initializer_list
 ;
syntax Mem_initializer_list
        = 
        Mem_initializer Mem_initializer "," Mem_initializer_list
 ;
syntax Mem_initializer
        = 
        Mem_initializer_id "(" Expression_list? ")"
 ;
syntax Mem_initializer_id
        = 
        "::"? Nested_name_specifier? Class_name Identifier
 ;
syntax Operator_function_id
        = 
        "operator" Operator
 ;
syntax Operator
        = "new"
        | "delete"
        | "new" "[]"
        | "delete" "[]"
        | "+"
        | "-"
        | "*"
        | "/"
        | "%"
        | "^"
        | "&"
        | "|"
        | "~"
        | "!"
        | "="
        | "\<"
        | "\>"
        | "+="
        | "-="
        | "*="
        | "/="
        | "%="
        | "^="
        | "&="
        | "|="
        | "\<\<"
        | "\>\>"
        | "\>\>="
        | "\<\<="
        | "=="
        | "!="
        | "\<="
        | "\>="
        | "&&"
        | "||"
        | "++"
        | "--"
        | ","
        | "-\>*"
        | "-\>"
        | "()"
        | "[]"
 ;
syntax Template_declaration
        = 
        "export"? "template" "\<" Template_parameter_list "\>" Declaration
 ;
syntax Template_parameter_list
        = 
        Template_parameter Template_parameter_list "," Template_parameter
 ;
syntax Template_parameter
        = 
        Type_parameter Parameter_declaration
 ;
syntax Type_parameter
        = 
        "class" Identifier? "class" Identifier? "=" Type_id "typename" Identifier? "typename" Identifier? "=" Type_id "template" "\<" Template_parameter_list "\>" "class" Identifier? "template" "\<" Template_parameter_list "\>" "class" Identifier? "=" Id_expression
 ;
syntax Template_id
        = 
        Template_name "\<" Template_argument_list? "\>"
 ;
syntax Template_name
        = 
        Identifier
 ;
syntax Template_argument_list
        = 
        Template_argument Template_argument_list "," Template_argument
 ;
syntax Template_argument
        = 
        Assignment_expression Type_id Id_expression
 ;
syntax Explicit_instantiation
        = 
        "template" Declaration
 ;
syntax Explicit_specialization
        = 
        "template" "\<" "\>" Declaration
 ;
syntax Try_block
        = 
        "try" Compound_statement Handler_seq
 ;
syntax Function_try_block
        = 
        "try" Ctor_initializer? Function_body Handler_seq
 ;
syntax Handler_seq
        = 
        Handler Handler_seq?
 ;
syntax Handler
        = 
        "catch" "(" Exception_declaration ")" Compound_statement
 ;
syntax Exception_declaration
        = 
        Type_specifier_seq Declarator Type_specifier_seq Abstract_declarator Type_specifier_seq "..."
 ;
syntax Throw_expression
        = 
        "throw" Assignment_expression?
 ;
syntax Exception_specification
        = 
        "throw" "(" Type_id_list? ")"
 ;
syntax Type_id_list
        = 
        Type_id Type_id_list "," Type_id
 ;
