@contributor{bgf2src automated exporter - SLPS}
module Iso_25436_2006

syntax Class_name
        = 
        Identifier
 ;
syntax Class_declaration
        = 
        Notes? Class_header Formal_generics? Obsolete? Inheritance? Creators? Converters? Features? Invariant? Notes? "end"
 ;
syntax Notes
        = 
        "note" Note_list
 ;
syntax Note_list
        = 
        {Note_entry ";"}*
 ;
syntax Note_entry
        = 
        Note_name Note_values
 ;
syntax Note_name
        = 
        Identifier ":"
 ;
syntax Note_values
        = 
        Note_item ("," Note_item)*
 ;
syntax Note_item
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
        | "frozen"
 ;
syntax Obsolete
        = 
        "obsolete" Message
 ;
syntax Message
        = 
        Manifest_string
 ;
syntax Features
        = 
        Feature_clause+
 ;
syntax Feature_clause
        = 
        "feature" Clients? Header_comment? Feature_declaration_list
 ;
syntax Feature_declaration_list
        = 
        {Feature_declaration ";"}*
 ;
syntax Header_comment
        = 
        Comment
 ;
syntax Feature_declaration
        = 
        New_feature_list Declaration_body
 ;
syntax Declaration_body
        = 
        Formal_arguments? Query_mark? Feature_value?
 ;
syntax Query_mark
        = 
        Type_mark Assigner_mark?
 ;
syntax Type_mark
        = 
        ":" Type
 ;
syntax Feature_value
        = 
        Explicit_value? Obsolete? Header_comment? Attribute_or_routine?
 ;
syntax Explicit_value
        = 
        "=" Manifest_constant
 ;
syntax New_feature_list
        = 
        New_feature ("," New_feature)*
 ;
syntax New_feature
        = 
        "frozen"? Extended_feature_name
 ;
syntax Attribute_or_routine
        = 
        Precondition? Local_declarations? Feature_body Postcondition? Rescue? "end"
 ;
syntax Feature_body
        = Deferred
        | Effective_routine
        | Attribute
 ;
syntax Extended_feature_name
        = 
        Feature_name Alias?
 ;
syntax Feature_name
        = 
        Identifier
 ;
syntax Alias
        = 
        "alias" "\"" Alias_name "\"" "convert"?
 ;
syntax Alias_name
        = Operator
        | Bracket
 ;
syntax Bracket
        = 
        "[]"
 ;
syntax Operator
        = Unary
        | Binary
 ;
syntax Unary
        = "not"
        | "+"
        | "-"
        | Free_unary
 ;
syntax Binary
        = "+"
        | "-"
        | "*"
        | "/"
        | "//"
        | "\\\\"
        | "^"
        | ".."
        | "\<"
        | "\>"
        | "\<="
        | "\>="
        | "and"
        | "or"
        | "xor"
        | "and" "then"
        | "or" "else"
        | "implies"
        | Free_binary
 ;
syntax Assigner_mark
        = 
        "assign" Feature_name
 ;
syntax Inheritance
        = 
        Inherit_clause+
 ;
syntax Inherit_clause
        = 
        "inherit" Non_conformance? Parent_list
 ;
syntax Non_conformance
        = 
        "{" "NONE" "}"
 ;
syntax Parent_list
        = 
        Parent (";" Parent)*
 ;
syntax Parent
        = 
        Class_type Feature_adaptation?
 ;
syntax Feature_adaptation
        = 
        Undefine? Redefine? Rename? New_exports? Select? "end"
 ;
syntax Rename
        = 
        "rename" Rename_list
 ;
syntax Rename_list
        = 
        Rename_pair ("," Rename_pair)*
 ;
syntax Rename_pair
        = 
        Feature_name "as" Extended_feature_name
 ;
syntax Clients
        = 
        "{" Class_list "}"
 ;
syntax Class_list
        = 
        Class_name ("," Class_name)*
 ;
syntax New_exports
        = 
        "export" New_export_list
 ;
syntax New_export_list
        = 
        New_export_item (";" New_export_item)*
 ;
syntax New_export_item
        = 
        Clients Header_comment? Feature_set
 ;
syntax Feature_set
        = Feature_list
        | "all"
 ;
syntax Feature_list
        = 
        Feature_name ("," Feature_name)*
 ;
syntax Formal_arguments
        = 
        "(" Entity_declaration_list ")"
 ;
syntax Entity_declaration_list
        = 
        Entity_declaration_group (";" Entity_declaration_group)*
 ;
syntax Entity_declaration_group
        = 
        Identifier_list Type_mark
 ;
syntax Identifier_list
        = 
        Identifier ("," Identifier)*
 ;
syntax Deferred
        = 
        "deferred"
 ;
syntax Effective_routine
        = Internal
        | External
 ;
syntax Internal
        = 
        Routine_mark Compound
 ;
syntax Routine_mark
        = "do"
        | Once
 ;
syntax Once
        = 
        "once" ("(" Key_list ")")?
 ;
syntax Key_list
        = 
        Manifest_string ("," Manifest_string)*
 ;
syntax Local_declarations
        = 
        "local" Entity_declaration_list?
 ;
syntax Compound
        = 
        {Instruction ";"}*
 ;
syntax Instruction
        = Creation_instruction
        | Call
        | Assignment
        | Assigner_call
        | Conditional
        | Multi_branch
        | Loop
        | Debug
        | Precursor
        | Check
        | Retry
 ;
syntax Precondition
        = 
        "require" "else"? Assertion
 ;
syntax Postcondition
        = 
        "ensure" "then"? Assertion Only?
 ;
syntax Invariant
        = 
        "invariant" Assertion
 ;
syntax Assertion
        = 
        {Assertion_clause ";"}*
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
syntax Old
        = 
        "old" Expression
 ;
syntax Only
        = 
        "only" Feature_list?
 ;
syntax Check
        = 
        "check" Assertion Notes? "end"
 ;
syntax Variant
        = 
        "variant" Tag_mark? Expression
 ;
syntax Precursor
        = 
        Precursor Parent_qualification? Actuals?
 ;
syntax Parent_qualification
        = 
        "{" Class_name "}"
 ;
syntax Redefine
        = 
        "redefine" Feature_list
 ;
syntax Undefine
        = 
        "undefine" Feature_list
 ;
syntax Type
        = Class_or_tuple_type
        | Formal_generic_name
        | Anchored
 ;
syntax Class_or_tuple_type
        = Class_type
        | Tuple_type
 ;
syntax Class_type
        = 
        Attachment_mark? Class_name Actual_generics?
 ;
syntax Attachment_mark
        = "?"
        | "!"
 ;
syntax Anchored
        = 
        Attachment_mark? "like" Anchor
 ;
syntax Anchor
        = Feature_name
        | "Current"
 ;
syntax Actual_generics
        = 
        "[" Type_list "]"
 ;
syntax Type_list
        = 
        Type ("," Type)*
 ;
syntax Formal_generics
        = 
        "[" Formal_generic_list "]"
 ;
syntax Formal_generic_list
        = 
        Formal_generic ("," Formal_generic)*
 ;
syntax Formal_generic
        = 
        "frozen"? Formal_generic_name Constraint?
 ;
syntax Formal_generic_name
        = 
        "?"? Identifier
 ;
syntax Constraint
        = 
        "-\>" Constraining_types Constraint_creators?
 ;
syntax Constraining_types
        = Single_constraint
        | Multiple_constraint
 ;
syntax Single_constraint
        = 
        Type Renaming?
 ;
syntax Renaming
        = 
        Rename "end"
 ;
syntax Multiple_constraint
        = 
        "{" Constraint_list "}"
 ;
syntax Constraint_list
        = 
        Single_constraint ("," Single_constraint)*
 ;
syntax Constraint_creators
        = 
        "create" Feature_list "end"
 ;
syntax Tuple_type
        = 
        "TUPLE" Tuple_parameter_list?
 ;
syntax Tuple_parameter_list
        = 
        "[" Tuple_parameters "]"
 ;
syntax Tuple_parameters
        = Type_list
        | Entity_declaration_list
 ;
syntax Manifest_tuple
        = 
        "[" Expression_list "]"
 ;
syntax Expression_list
        = 
        {Expression ","}*
 ;
syntax Converters
        = 
        "convert" Converter_list
 ;
syntax Converter_list
        = 
        Converter ("," Converter)*
 ;
syntax Converter
        = Conversion_procedure
        | Conversion_query
 ;
syntax Conversion_procedure
        = 
        Feature_name "({" Type_list "})"
 ;
syntax Conversion_query
        = 
        Feature_name ":{" Type_list "}"
 ;
syntax Select
        = 
        "select" Feature_list
 ;
syntax Conditional
        = 
        "if" Then_part_list Else_part? "end"
 ;
syntax Then_part_list
        = 
        Then_part ("elseif" Then_part)*
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
        When_part+
 ;
syntax When_part
        = 
        "when" Choices "then" Compound
 ;
syntax Choices
        = 
        Choice ("," Choice)*
 ;
syntax Choice
        = Constant
        | Manifest_type
        | Constant_interval
        | Type_interval
 ;
syntax Constant_interval
        = 
        Constant ".." Constant
 ;
syntax Type_interval
        = 
        Manifest_type ".." Manifest_type
 ;
syntax Loop
        = 
        Initialization Invariant? Exit_condition Loop_body Variant? "end"
 ;
syntax Initialization
        = 
        "from" Compound
 ;
syntax Exit_condition
        = 
        "until" Boolean_expression
 ;
syntax Loop_body
        = 
        "loop" Compound
 ;
syntax Debug
        = 
        "debug" ("(" Key_list ")")? Compound "end"
 ;
syntax Attribute
        = 
        "attribute" Compound
 ;
syntax Entity
        = Variable
        | Read_only
 ;
syntax Variable
        = Variable_attribute
        | Local
 ;
syntax Variable_attribute
        = 
        Feature_name
 ;
syntax Local
        = Identifier
        | "Result"
 ;
syntax Read_only
        = Formal
        | Constant_attribute
        | "Current"
 ;
syntax Formal
        = 
        Identifier
 ;
syntax Constant_attribute
        = 
        Feature_name
 ;
syntax Creators
        = 
        Creation_clause+
 ;
syntax Creation_clause
        = 
        "create" Clients? Header_comment? Creation_procedure_list
 ;
syntax Creation_procedure_list
        = 
        Creation_procedure ("," Creation_procedure)*
 ;
syntax Creation_procedure
        = 
        Feature_name
 ;
syntax Creation_instruction
        = 
        "create" Explicit_creation_type? Creation_call
 ;
syntax Explicit_creation_type
        = 
        "{" Type "}"
 ;
syntax Creation_call
        = 
        Variable Explicit_creation_call?
 ;
syntax Explicit_creation_call
        = 
        "." Unqualified_call
 ;
syntax Creation_expression
        = 
        "create" Explicit_creation_type Explicit_creation_call?
 ;
syntax Equality
        = 
        Expression Comparison Expression
 ;
syntax Comparison
        = "="
        | "/="
        | "~"
        | "/~"
 ;
syntax Assignment
        = 
        Variable ":=" Expression
 ;
syntax Assigner_call
        = 
        Expression ":=" Expression
 ;
syntax Call
        = Object_call
        | Non_object_call
 ;
syntax Object_call
        = 
        (Target ".")? Unqualified_call
 ;
syntax Unqualified_call
        = 
        Feature_name Actuals?
 ;
syntax Target
        = Local
        | Read_only
        | Call
        | Parenthesized_target
 ;
syntax Parenthesized_target
        = 
        "(|" Expression "|)"
 ;
syntax Non_object_call
        = 
        "{" Type "}." Unqualified_call
 ;
syntax Actuals
        = 
        "(" Actual_list ")"
 ;
syntax Actual_list
        = 
        Expression ("," Expression)*
 ;
syntax Object_test
        = 
        "{" Identifier ":" Type "}" Expression
 ;
syntax Rescue
        = 
        "rescue" Compound
 ;
syntax Retry
        = 
        "retry"
 ;
syntax Agent
        = Call_agent
        | Inline_agent
 ;
syntax Call_agent
        = 
        "agent" Call_agent_body
 ;
syntax Inline_agent
        = 
        "agent" Formal_arguments? Type_mark? Attribute_or_routine? Agent_actuals?
 ;
syntax Call_agent_body
        = Agent_qualified
        | Agent_unqualified
 ;
syntax Agent_qualified
        = 
        Agent_target "." Agent_unqualified
 ;
syntax Agent_unqualified
        = 
        Feature_name Agent_actuals?
 ;
syntax Agent_target
        = Entity
        | Parenthesized
        | Manifest_type
 ;
syntax Agent_actuals
        = 
        "(" Agent_actual_list ")"
 ;
syntax Agent_actual_list
        = 
        Agent_actual ("," Agent_actual)*
 ;
syntax Agent_actual
        = Expression
        | Placeholder
 ;
syntax Placeholder
        = 
        Manifest_type? "?"
 ;
syntax Expression
        = Basic_expression
        | Special_expression
 ;
syntax Basic_expression
        = Read_only
        | Local
        | Call
        | Precursor
        | Equality
        | Parenthesized
        | Old
        | Operator_expression
        | Bracket_expression
        | Creation_expression
 ;
syntax Special_expression
        = Manifest_constant
        | Manifest_tuple
        | Agent
        | Object_test
        | Once_string
        | Address
 ;
syntax Parenthesized
        = 
        "(" Expression ")"
 ;
syntax Address
        = 
        "$" Variable
 ;
syntax Once_string
        = 
        "once" Manifest_string
 ;
syntax Boolean_expression
        = Basic_expression
        | Boolean_constant
        | Object_test
 ;
syntax Operator_expression
        = Unary_expression
        | Binary_expression
 ;
syntax Unary_expression
        = 
        Unary Expression
 ;
syntax Binary_expression
        = 
        Expression Binary Expression
 ;
syntax Bracket_expression
        = 
        Bracket_target "[" Actuals "]"
 ;
syntax Bracket_target
        = Target
        | Once_string
        | Manifest_constant
        | Manifest_tuple
 ;
syntax Constant
        = Manifest_constant
        | Constant_attribute
 ;
syntax Manifest_constant
        = 
        Manifest_type? Manifest_value
 ;
syntax Manifest_type
        = 
        "{" Type "}"
 ;
syntax Manifest_value
        = Boolean_constant
        | Character_constant
        | Integer_constant
        | Real_constant
        | Manifest_string
        | Manifest_type
 ;
syntax Sign
        = "+"
        | "-"
 ;
syntax Integer_constant
        = 
        Sign? Integer
 ;
syntax Character_constant
        = 
        "'" Character "'"
 ;
syntax Boolean_constant
        = "True"
        | "False"
 ;
syntax Real_constant
        = 
        Sign? Real
 ;
syntax Manifest_string
        = Basic_manifest_string
        | Verbatim_string
 ;
syntax Basic_manifest_string
        = 
        "\"" String_content "\""
 ;
syntax String_content
        = 
        Simple_string (Line_wrapping_part Simple_string)*
 ;
syntax Verbatim_string
        = 
        Verbatim_string_opener Line_sequence Verbatim_string_closer
 ;
syntax Verbatim_string_opener
        = 
        "\"" Simple_string? Open_bracket
 ;
syntax Verbatim_string_closer
        = 
        Close_bracket Simple_string? "\""
 ;
syntax Open_bracket
        = "["
        | "{"
 ;
syntax Close_bracket
        = "]"
        | "}"
 ;
syntax External
        = 
        "external" External_language External_name?
 ;
syntax External_language
        = Unregistered_language
        | Registered_language
 ;
syntax Unregistered_language
        = 
        Manifest_string
 ;
syntax External_name
        = 
        "alias" Manifest_string
 ;
syntax Registered_language
        = C_external
        | CPP_external
        | DLL_external
 ;
syntax External_signature
        = 
        "signature" External_argument_types? (":" External_type)?
 ;
syntax External_argument_types
        = 
        "(" External_type_list ")"
 ;
syntax External_type_list
        = 
        {External_type ","}*
 ;
syntax External_type
        = 
        Simple_string
 ;
syntax External_file_use
        = 
        "use" External_file_list
 ;
syntax External_file_list
        = 
        External_file ("," External_file)*
 ;
syntax External_file
        = External_user_file
        | External_system_file
 ;
syntax External_user_file
        = 
        "\"" Simple_string "\""
 ;
syntax External_system_file
        = 
        "\<" Simple_string "\>"
 ;
syntax C_external
        = 
        "\"" "C" "inline"? External_signature? External_file_use? "\""
 ;
syntax CPP_external
        = 
        "\"" "C++" "inline" External_signature? External_file_use? "\""
 ;
syntax DLL_external
        = 
        "\"" "dll" "windows"? DLL_identifier DLL_index? External_signature? External_file_use? "\""
 ;
syntax DLL_identifier
        = 
        Simple_string
 ;
syntax DLL_index
        = 
        Integer
 ;
syntax Comment
        = 
        "--" {Simple_string Comment_break}*
 ;
syntax Comment_break
        = 
        New_line Blanks_or_tabs? "--"
 ;
syntax Integer
        = 
        Integer_base? Digit_sequence
 ;
syntax Integer_base
        = 
        "0" Integer_base_letter
 ;
syntax Integer_base_letter
        = "b"
        | "c"
        | "x"
        | "B"
        | "C"
        | "X"
 ;
syntax Digit_sequence
        = 
        Digit+
 ;
syntax Digit
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
        | "a"
        | "b"
        | "c"
        | "d"
        | "e"
        | "f"
        | "A"
        | "B"
        | "C"
        | "D"
        | "E"
        | "F"
        | "_"
 ;
