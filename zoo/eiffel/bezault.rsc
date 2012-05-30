@contributor{bgf2src automated exporter - SLPS}
module Bezault

syntax Class_declaration
        = 
        Indexing? Class_header Formal_generics? Obsolete? Inheritance? Creators? Features? Invariant? "end" ("--" "class" Class_name)?
 ;
syntax Indexing
        = 
        "indexing" Index_list
 ;
syntax Index_list
        = 
        (Index_clause ";")*
 ;
syntax Index_clause
        = 
        Index? Index_terms
 ;
syntax Index
        = 
        Identifier ":"
 ;
syntax Index_terms
        = 
        (Index_value ",")+
 ;
syntax Index_value
        = Identifier
        | Manifest_constant
 ;
syntax Class_header
        = 
        Header_mark? "class" Class_name
 ;
syntax Header_mark
        = "deferred"
        | "expanded"
        | "separate"
 ;
syntax Class_name
        = 
        Identifier
 ;
syntax Formal_generics
        = 
        Formal_generic_list?
 ;
syntax Formal_generic_list
        = 
        (Formal_generic ",")*
 ;
syntax Formal_generic
        = 
        Formal_generic_name Constraint?
 ;
syntax Formal_generic_name
        = 
        Identifier
 ;
syntax Constraint
        = 
        "-" "\>" Class_type
 ;
syntax Obsolete
        = 
        "obsolete" Message
 ;
syntax Message
        = 
        Manifest_string
 ;
syntax Inheritance
        = 
        "inherit" Parent_list
 ;
syntax Parent_list
        = 
        (Parent ";")*
 ;
syntax Parent
        = 
        Class_type Feature_adaptation?
 ;
syntax Feature_adaptation
        = 
        Rename? New_exports? Undefine? Redefine? Select? "end"
 ;
syntax Rename
        = 
        "rename" Rename_list
 ;
syntax Rename_list
        = 
        (Rename_pair ",")*
 ;
syntax Rename_pair
        = 
        Feature_name "as" Feature_name
 ;
syntax New_exports
        = 
        "export" New_export_list
 ;
syntax New_export_list
        = 
        (New_export_item ";")*
 ;
syntax New_export_item
        = 
        Clients Feature_set
 ;
syntax Feature_set
        = Feature_list
        | "all"
 ;
syntax Feature_list
        = 
        (Feature_name ",")*
 ;
syntax Clients
        = 
        "{" Class_list "}"
 ;
syntax Class_list
        = 
        (Class_name ",")*
 ;
syntax Redefine
        = 
        "redefine" Feature_list
 ;
syntax Undefine
        = 
        "undefine" Feature_list
 ;
syntax Select
        = 
        "select" Feature_list
 ;
syntax Creators
        = 
        "creation" (Creation_clause "creation")+
 ;
syntax Creation_clause
        = 
        Clients? Header_comment? Procedure_list
 ;
syntax Procedure_list
        = 
        (Procedure_name ",")*
 ;
syntax Procedure_name
        = 
        Identifier
 ;
syntax Features
        = 
        "feature" (Feature_clause "feature")+
 ;
syntax Feature_clause
        = 
        Clients? Header_comment? Feature_declaration_list
 ;
syntax Feature_declaration_list
        = 
        (Feature_declaration ";")*
 ;
syntax Feature_declaration
        = 
        New_feature_list Declaration_body
 ;
syntax Declaration_body
        = 
        Formal_arguments? Type_mark? Constant_or_routine?
 ;
syntax Constant_or_routine
        = 
        "is" Feature_value
 ;
syntax Feature_value
        = Manifest_constant
        | Unique
        | Routine
 ;
syntax Unique
        = 
        "Unique"
 ;
syntax New_feature_list
        = 
        (New_feature ",")+
 ;
syntax New_feature
        = 
        "frozen"? Feature_name
 ;
syntax Feature_name
        = Identifier
        | Prefix
        | Infix
 ;
syntax Prefix
        = 
        "prefix" "\"" Prefix_operator "\""
 ;
syntax Infix
        = 
        "infix" "\"" Infix_operator "\""
 ;
syntax Prefix_operator
        = Unary
        | Free_operator
 ;
syntax Infix_operator
        = Binary
        | Free_operator
 ;
syntax Unary
        = "not"
        | "+"
        | "-"
 ;
syntax Binary
        = "+"
        | "-"
        | "*"
        | "/"
        | "\<"
        | "\>"
        | "\<="
        | "\>="
        | "//"
        | "\\\\"
        | "^"
        | "and"
        | "or"
        | "xor"
        | "and" "then"
        | "or" "else"
        | "implies"
 ;
syntax Formal_arguments
        = 
        "(" Entity_declaration_list ")"
 ;
syntax Entity_declaration_list
        = 
        (Entity_declaration_group ";")*
 ;
syntax Entity_declaration_group
        = 
        Identifier_list Type_mark
 ;
syntax Identifier_list
        = 
        (Identifier ",")+
 ;
syntax Type_mark
        = 
        ":" Type
 ;
syntax Routine
        = 
        Obsolete? Header_comment? Precondition? Local_declarations? Routine_body Postcondition? Rescue? "end" ("--" Feature_name)?
 ;
syntax Routine_body
        = Effective
        | Deferred
 ;
syntax Effective
        = Internal
        | External
 ;
syntax Internal
        = 
        Routine_mark Compound
 ;
syntax Routine_mark
        = "do"
        | "once"
 ;
syntax Deferred
        = 
        "deferred"
 ;
syntax External
        = 
        "external" Language_name External_name?
 ;
syntax Language_name
        = 
        Manifest_string
 ;
syntax External_name
        = 
        "alias" Manifest_string
 ;
syntax Local_declarations
        = 
        "local" Entity_declaration_list
 ;
syntax Precondition
        = 
        "require" "else"? Assertion
 ;
syntax Postcondition
        = 
        "ensure" "then"? Assertion
 ;
syntax Invariant
        = 
        "invariant" Assertion
 ;
syntax Assertion
        = 
        (Assertion_clause ";")*
 ;
syntax Assertion_clause
        = 
        Tag_mark? Unlabeled_assertion_clause
 ;
syntax Unlabeled_assertion_clause
        = Boolean_expression
        | Comment
 ;
syntax Tag_mark
        = 
        Tag ":"
 ;
syntax Tag
        = 
        Identifier
 ;
syntax Rescue
        = 
        "rescue" Compound
 ;
syntax Type
        = Class_type
        | Class_type_expanded
        | Class_type_separate
        | Anchored
        | Bit_type
 ;
syntax Class_type
        = 
        Class_name Actual_generics?
 ;
syntax Actual_generics
        = 
        Type_list?
 ;
syntax Type_list
        = 
        (Type ",")*
 ;
syntax Class_type_expanded
        = 
        "expanded" Class_type
 ;
syntax Class_type_separate
        = 
        "separate" Class_type
 ;
syntax Bit_type
        = 
        "BIT" Bit_length
 ;
syntax Bit_length
        = Integer_constant
        | Attribute
 ;
syntax Anchored
        = 
        "like" Anchor
 ;
syntax Anchor
        = Identifier
        | "Current"
 ;
syntax Compound
        = 
        (Instruction ";")*
 ;
syntax Instruction
        = Creation
        | Call
        | Assignment
        | Assignment_attempt
        | Conditional
        | Multi_branch
        | Loop
        | Debug
        | Check
        | Retry
        | Null_instruction
 ;
syntax Creation
        = 
        "!" Type? "!" Writable Creation_call?
 ;
syntax Creation_call
        = 
        "." Procedure_name Actuals?
 ;
syntax Assignment
        = 
        Writable ":=" Expression
 ;
syntax Assignment_attempt
        = 
        Writable "?=" Expression
 ;
syntax Conditional
        = 
        "if" Then_part_list Else_part? "end"
 ;
syntax Then_part_list
        = 
        (Then_part "elseif")+
 ;
syntax Then_part
        = 
        Boolean_expression "then" Compound
 ;
syntax Else_part
        = 
        "else" Compound
 ;
syntax Multi_branch
        = 
        "inspect" Expression When_part_list? Else_part? "end"
 ;
syntax When_part_list
        = 
        "when" (When_part "when")+
 ;
syntax When_part
        = 
        Choices "then" Compound
 ;
syntax Choices
        = 
        (Choice ",")*
 ;
syntax Choice
        = Choice_constant
        | Interval
 ;
syntax Interval
        = 
        Choice_constant ".." Choice_constant
 ;
syntax Choice_constant
        = Integer_constant
        | Character_constant
        | Attribute
 ;
syntax Loop
        = 
        Initialization Invariant? Variant? Loop_body "end"
 ;
syntax Initialization
        = 
        "from" Compound
 ;
syntax Variant
        = 
        "variant" Tag_mark? Expression
 ;
syntax Loop_body
        = 
        Exit "loop" Compound
 ;
syntax Exit
        = 
        "until" Boolean_expression
 ;
syntax Debug
        = 
        "debug" Debug_keys? Compound "end"
 ;
syntax Debug_keys
        = 
        "(" Debug_key_list ")"
 ;
syntax Debug_key_list
        = 
        (Debug_key ",")*
 ;
syntax Debug_key
        = 
        Manifest_string
 ;
syntax Check
        = 
        "check" Assertion "end"
 ;
syntax Retry
        = 
        "retry"
 ;
syntax Null_instruction
        = 
        ()
 ;
syntax Call
        = Qualified_call
        | Precursor
 ;
syntax Qualified_call
        = 
        Call_qualifier? Call_chain
 ;
syntax Call_qualifier
        = 
        Call_target "."
 ;
syntax Call_target
        = Parenthesized
        | "Result"
        | "Current"
        | Precursor
 ;
syntax Call_chain
        = 
        (Unqualified_call ".")+
 ;
syntax Unqualified_call
        = 
        Identifier Actuals?
 ;
syntax Precursor
        = 
        Parent_qualification? "Precursor" Actuals?
 ;
syntax Parent_qualification
        = 
        "{" Class_name "}"
 ;
syntax Attribute
        = 
        Identifier
 ;
syntax Writable
        = Identifier
        | "Result"
 ;
syntax Actuals
        = 
        "(" Actual_list ")"
 ;
syntax Actual_list
        = 
        (Actual ",")*
 ;
syntax Actual
        = Expression
        | Address
 ;
syntax Address
        = 
        "$" Address_mark
 ;
syntax Address_mark
        = Feature_name
        | "Current"
        | "Result"
 ;
syntax Expression
        = "Current"
        | "Result"
        | Call
        | Operator_expression
        | Equality
        | Manifest_array
        | Old
        | Strip
        | Boolean_constant
        | Bit_constant
        | Integer
        | Real
        | Manifest_string
        | Character_constant
        | Wide_character_constant
        | Wide_manifest_string
        | Hexadecimal_constant
 ;
syntax Boolean_expression
        = 
        Expression
 ;
syntax Operator_expression
        = Parenthesized
        | Unary_expression
        | Binary_expression
 ;
syntax Parenthesized
        = 
        "(" Expression ")"
 ;
syntax Unary_expression
        = 
        Prefix_operator Expression
 ;
syntax Binary_expression
        = 
        Expression Infix_operator Expression
 ;
syntax Equality
        = 
        Expression Comparison Expression
 ;
syntax Comparison
        = "="
        | "/="
 ;
syntax Manifest_constant
        = Boolean_constant
        | Character_constant
        | Integer_constant
        | Real_constant
        | Manifest_string
        | Bit_constant
        | Wide_character_constant
        | Wide_manifest_string
        | Hexadecimal_constant
 ;
syntax Boolean_constant
        = "True"
        | "False"
 ;
syntax Integer_constant
        = 
        Sign? Integer
 ;
syntax Real_constant
        = 
        Sign? Real
 ;
syntax Sign
        = "+"
        | "-"
 ;
syntax Wide_character_constant
        = 
        "$" Character_constant
 ;
syntax Wide_manifest_string
        = 
        "$" Manifest_string
 ;
syntax Manifest_array
        = 
        "\<\<" Expression_list "\>\>"
 ;
syntax Expression_list
        = 
        (Expression ",")*
 ;
syntax Old
        = 
        "old" Expression
 ;
syntax Strip
        = 
        "Strip" "(" Attribute_list ")"
 ;
syntax Attribute_list
        = 
        (Attribute ",")*
 ;
syntax Identifier
        = 
        Letter (Letter | Decimal_digit | "_")*
 ;
syntax Integer
        = Decimal_digit+
        | Decimal_digit (Decimal_digit Decimal_digit?)? ("_" Decimal_digit Decimal_digit Decimal_digit)+
 ;
