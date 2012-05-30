@contributor{bgf2src automated exporter - SLPS}
module Lncs_4348

syntax Identifier
        = 
        Identifier_start (Identifier_start | Identifier_extend)*
 ;
syntax Identifier_start
        = Letter_uppercase
        | Letter_lowercase
        | Letter_titlecase
        | Letter_modifier
        | Letter_other
        | Number_letter
 ;
syntax Identifier_extend
        = Mark_non_spacing
        | Mark_spacing_combining
        | Number_decimal
        | Punctuation_connector
        | Other_format
 ;
syntax Numeric_literal
        = Decimal_literal
        | Based_literal
 ;
syntax Decimal_literal
        = 
        Numeral ("." Numeral)? Exponent?
 ;
syntax Numeral
        = 
        Digit (Underline? Digit)*
 ;
syntax Exponent
        = "E" "+"? Numeral
        | "E" "-" Numeral
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
 ;
syntax Based_literal
        = 
        Base "#" Based_numeral ("." Based_numeral)? "#" Exponent?
 ;
syntax Base
        = 
        Numeral
 ;
syntax Based_numeral
        = 
        Extended_digit (Underline? Extended_digit)*
 ;
syntax Extended_digit
        = Digit
        | "A"
        | "B"
        | "C"
        | "D"
        | "E"
        | "F"
 ;
syntax Character_literal
        = 
        "'" Graphic_character "'"
 ;
syntax String_literal
        = 
        "\"" String_element* "\""
 ;
syntax String_element
        = "\"\""
        | Non_quotation_mark_graphic_character
 ;
syntax Comment
        = 
        "-" "-" Non_end_of_line_character*
 ;
syntax Pragma
        = 
        "pragma" Identifier ("(" Pragma_argument_association ("," Pragma_argument_association)* ")")? ";"
 ;
syntax Pragma_argument_association
        = (Pragma_argument_identifier "=\>")? Name
        | (Pragma_argument_identifier "=\>")? Expression
 ;
syntax Basic_declaration
        = Type_declaration
        | Object_declaration
        | Subprogram_declaration
        | Null_procedure_declaration
        | Renaming_declaration
        | Generic_declaration
        | Subtype_declaration
        | Number_declaration
        | Abstract_subprogram_declaration
        | Package_declaration
        | Exception_declaration
        | Generic_instantiation
 ;
syntax Defining_identifier
        = 
        Identifier
 ;
syntax Type_declaration
        = Full_type_declaration
        | Incomplete_type_declaration
        | Private_type_declaration
        | Private_extension_declaration
 ;
syntax Full_type_declaration
        = "type" Defining_identifier Known_discriminant_part? "is" Type_definition ";"
        | Task_type_declaration
        | Protected_type_declaration
 ;
syntax Type_definition
        = Enumeration_type_definition
        | Real_type_definition
        | Record_type_definition
        | Derived_type_definition
        | Integer_type_definition
        | Array_type_definition
        | Access_type_definition
        | Interface_type_definition
 ;
syntax Subtype_declaration
        = 
        "subtype" Defining_identifier "is" Subtype_indication ";"
 ;
syntax Subtype_indication
        = 
        Null_exclusion? Subtype_mark Constraint?
 ;
syntax Subtype_mark
        = 
        Subtype_name
 ;
syntax Constraint
        = Scalar_constraint
        | Composite_constraint
 ;
syntax Scalar_constraint
        = Range_constraint
        | Digits_constraint
        | Delta_constraint
 ;
syntax Composite_constraint
        = Index_constraint
        | Discriminant_constraint
 ;
syntax Object_declaration
        = Defining_identifier_list ":" "aliased"? "constant"? Subtype_indication (":=" Expression)? ";"
        | Defining_identifier_list ":" "aliased"? "constant"? Access_definition (":=" Expression)? ";"
        | Defining_identifier_list ":" "aliased"? "constant"? Array_type_definition (":=" Expression)? ";"
        | Single_task_declaration
        | Single_protected_declaration
 ;
syntax Defining_identifier_list
        = 
        Defining_identifier ("," Defining_identifier)*
 ;
syntax Number_declaration
        = 
        Defining_identifier_list ":" "constant" ":=" Static_expression ";"
 ;
syntax Derived_type_definition
        = 
        "abstract"? "limited"? "new" Parent_subtype_indication (("and" Interface_list)? Record_extension_part)?
 ;
syntax Range_constraint
        = 
        "range" Range
 ;
syntax Range
        = Range_attribute_reference
        | Simple_expression ".." Simple_expression
 ;
syntax Enumeration_type_definition
        = 
        "(" Enumeration_literal_specification ("," Enumeration_literal_specification)* ")"
 ;
syntax Enumeration_literal_specification
        = Defining_identifier
        | Defining_character_literal
 ;
syntax Defining_character_literal
        = 
        Character_literal
 ;
syntax Integer_type_definition
        = Signed_integer_type_definition
        | Modular_type_definition
 ;
syntax Signed_integer_type_definition
        = 
        "range" Static_simple_expression ".." Static_simple_expression
 ;
syntax Modular_type_definition
        = 
        "mod" Static_expression
 ;
syntax Real_type_definition
        = Floating_point_definition
        | Fixed_point_definition
 ;
syntax Floating_point_definition
        = 
        "digits" Static_expression Real_range_specification?
 ;
syntax Real_range_specification
        = 
        "range" Static_simple_expression ".." Static_simple_expression
 ;
syntax Fixed_point_definition
        = Ordinary_fixed_point_definition
        | Decimal_fixed_point_definition
 ;
syntax Ordinary_fixed_point_definition
        = 
        "delta" Static_expression Real_range_specification
 ;
syntax Decimal_fixed_point_definition
        = 
        "delta" Static_expression "digits" Static_expression Real_range_specification?
 ;
syntax Digits_constraint
        = 
        "digits" Static_expression Range_constraint?
 ;
syntax Array_type_definition
        = Unconstrained_array_definition
        | Constrained_array_definition
 ;
syntax Unconstrained_array_definition
        = 
        "array" "(" Index_subtype_definition ("," Index_subtype_definition)* ")" "of" Component_definition
 ;
syntax Index_subtype_definition
        = 
        Subtype_mark "range" "\<\>"
 ;
syntax Constrained_array_definition
        = 
        "array" "(" Discrete_subtype_definition ("," Discrete_subtype_definition)* ")" "of" Component_definition
 ;
syntax Discrete_subtype_definition
        = Discrete_subtype_indication
        | Range
 ;
syntax Component_definition
        = "aliased"? Subtype_indication
        | "aliased"? Access_definition
 ;
syntax Index_constraint
        = 
        "(" Discrete_range ("," Discrete_range)* ")"
 ;
syntax Discrete_range
        = Discrete_subtype_indication
        | Range
 ;
syntax Discriminant_part
        = Unknown_discriminant_part
        | Known_discriminant_part
 ;
syntax Unknown_discriminant_part
        = 
        "(\<\>)"
 ;
syntax Known_discriminant_part
        = 
        "(" Discriminant_specification (";" Discriminant_specification)* ")"
 ;
syntax Discriminant_specification
        = Defining_identifier_list ":" Null_exclusion? Subtype_mark (":=" Default_expression)?
        | Defining_identifier_list ":" Access_definition (":=" Default_expression)?
 ;
syntax Default_expression
        = 
        Expression
 ;
syntax Discriminant_constraint
        = 
        "(" Discriminant_association ("," Discriminant_association)* ")"
 ;
syntax Discriminant_association
        = 
        {Discriminant_selector_name "|"}* Expression
 ;
syntax Record_type_definition
        = 
        ("abstract"? "tagged")? "limited"? Record_definition
 ;
syntax Record_definition
        = "record" Component_list "end" "record"
        | "null" "record"
 ;
syntax Component_list
        = Component_item Component_item*
        | Component_item* Variant_part
        | "null" ";"
 ;
syntax Component_item
        = Component_declaration
        | Aspect_clause
 ;
syntax Component_declaration
        = 
        Defining_identifier_list ":" Component_definition (":=" Default_expression)? ";"
 ;
syntax Variant_part
        = 
        "case" Discriminant_direct_name "is" Variant+ "end" "case" ";"
 ;
syntax Variant
        = 
        "when" Discrete_choice_list "=\>" Component_list
 ;
syntax Discrete_choice_list
        = 
        Discrete_choice ("|" Discrete_choice)*
 ;
syntax Discrete_choice
        = Expression
        | Discrete_range
        | "others"
 ;
syntax Record_extension_part
        = 
        "with" Record_definition
 ;
syntax Abstract_subprogram_declaration
        = 
        Overriding_indicator? Subprogram_specification "is" "abstract" ";"
 ;
syntax Interface_type_definition
        = 
        ("limited" | "task" | "protected" | "synchronized")? "interface" ("and" Interface_list)?
 ;
syntax Interface_list
        = 
        Interface_subtype_mark ("and" Interface_subtype_mark)*
 ;
syntax Access_type_definition
        = Null_exclusion? Access_to_object_definition
        | Null_exclusion? Access_to_subprogram_definition
 ;
syntax Access_to_object_definition
        = 
        "access" General_access_modifier? Subtype_indication
 ;
syntax General_access_modifier
        = "all"
        | "constant"
 ;
syntax Access_to_subprogram_definition
        = "access" "protected"? "procedure" Parameter_profile
        | "access" "protected"? "function" Parameter_and_result_profile
 ;
syntax Null_exclusion
        = 
        "not" "null"
 ;
syntax Access_definition
        = Null_exclusion? "access" "constant"? Subtype_mark
        | Null_exclusion? "access" "protected"? "procedure" Parameter_profile
        | Null_exclusion? "access" "protected"? "function" Parameter_and_result_profile
 ;
syntax Incomplete_type_declaration
        = 
        "type" Defining_identifier Discriminant_part? ("is" "tagged")? ";"
 ;
syntax Declarative_part
        = 
        Declarative_item*
 ;
syntax Declarative_item
        = Basic_declarative_item
        | Body
 ;
syntax Basic_declarative_item
        = Basic_declaration
        | Aspect_clause
        | Use_clause
 ;
syntax Body
        = Proper_body
        | Body_stub
 ;
syntax Proper_body
        = Subprogram_body
        | Package_body
        | Task_body
        | Protected_body
 ;
syntax Name
        = Direct_name
        | Indexed_component
        | Selected_component
        | Type_conversion
        | Character_literal
        | Explicit_dereference
        | Slice
        | Attribute_reference
        | Function_call
 ;
syntax Direct_name
        = Identifier
        | Operator_symbol
 ;
syntax Prefix
        = Name
        | Implicit_dereference
 ;
syntax Explicit_dereference
        = 
        Name "." "all"
 ;
syntax Implicit_dereference
        = 
        Name
 ;
syntax Indexed_component
        = 
        Prefix "(" Expression ("," Expression)* ")"
 ;
syntax Slice
        = 
        Prefix "(" Discrete_range ")"
 ;
syntax Selected_component
        = 
        Prefix "." Selector_name
 ;
syntax Selector_name
        = Identifier
        | Character_literal
        | Operator_symbol
 ;
syntax Attribute_reference
        = 
        Prefix "'" Attribute_designator
 ;
syntax Attribute_designator
        = Identifier ("(" Static_expression ")")?
        | "Access"
        | "Delta"
        | "Digits"
 ;
syntax Range_attribute_reference
        = 
        Prefix "'" Range_attribute_designator
 ;
syntax Range_attribute_designator
        = 
        "Range" ("(" Static_expression ")")?
 ;
syntax Aggregate
        = Record_aggregate
        | Extension_aggregate
        | Array_aggregate
 ;
syntax Record_aggregate
        = 
        "(" Record_component_association_list ")"
 ;
syntax Record_component_association_list
        = Record_component_association ("," Record_component_association)*
        | "null" "record"
 ;
syntax Record_component_association
        = (Component_choice_list "=\>")? Expression
        | Component_choice_list "=\>\<\>"
 ;
syntax Component_choice_list
        = Component_selector_name ("|" Component_selector_name)*
        | "others"
 ;
syntax Extension_aggregate
        = 
        "(" Ancestor_part "with" Record_component_association_list ")"
 ;
syntax Ancestor_part
        = Expression
        | Subtype_mark
 ;
syntax Array_aggregate
        = Positional_array_aggregate
        | Named_array_aggregate
 ;
syntax Positional_array_aggregate
        = "(" Expression "," Expression ("," Expression)* ")"
        | "(" Expression ("," Expression)* "," "others" "=\>" Expression ")"
        | "(" Expression ("," Expression)* "," "others" "=\>\<\>)"
 ;
syntax Named_array_aggregate
        = 
        "(" Array_component_association ("," Array_component_association)* ")"
 ;
syntax Array_component_association
        = Discrete_choice_list "=\>" Expression
        | Discrete_choice_list "=\>\<\>"
 ;
syntax Expression
        = Relation ("and" Relation)*
        | Relation ("or" Relation)*
        | Relation ("xor" Relation)*
        | Relation ("and" "then" Relation)*
        | Relation ("or" "else" Relation)*
 ;
syntax Relation
        = Simple_expression (Relational_operator Simple_expression)?
        | Simple_expression "not"? "in" Range
        | Simple_expression "not"? "in" Subtype_mark
 ;
syntax Simple_expression
        = 
        Unary_adding_operator? Term (Binary_adding_operator Term)*
 ;
syntax Term
        = 
        Factor (Multiplying_operator Factor)*
 ;
syntax Factor
        = Primary ("**" Primary)?
        | "abs" Primary
        | "not" Primary
 ;
syntax Primary
        = Numeric_literal
        | "null"
        | String_literal
        | Aggregate
        | Name
        | Qualified_expression
        | Allocator
        | "(" Expression ")"
 ;
syntax Logical_operator
        = "and"
        | "or"
        | "xor"
 ;
syntax Relational_operator
        = "="
        | "/="
        | "\<"
        | "\<="
        | "\>"
        | "\>="
 ;
syntax Binary_adding_operator
        = "+"
        | "-"
        | "&"
 ;
syntax Unary_adding_operator
        = "+"
        | "-"
 ;
syntax Multiplying_operator
        = "*"
        | "/"
        | "mod"
        | "rem"
 ;
syntax Highest_precedence_operator
        = "**"
        | "abs"
        | "not"
 ;
syntax Type_conversion
        = Subtype_mark "(" Expression ")"
        | Subtype_mark "(" Name ")"
 ;
syntax Qualified_expression
        = Subtype_mark "'(" Expression ")"
        | Subtype_mark "'" Aggregate
 ;
syntax Allocator
        = "new" Subtype_indication
        | "new" Qualified_expression
 ;
syntax Sequence_of_statements
        = 
        Statement Statement*
 ;
syntax Statement
        = Label* Simple_statement
        | Label* Compound_statement
 ;
syntax Simple_statement
        = Null_statement
        | Assignment_statement
        | Goto_statement
        | Simple_return_statement
        | Requeue_statement
        | Abort_statement
        | Code_statement
        | Exit_statement
        | Procedure_call_statement
        | Entry_call_statement
        | Delay_statement
        | Raise_statement
 ;
syntax Compound_statement
        = If_statement
        | Loop_statement
        | Extended_return_statement
        | Accept_statement
        | Case_statement
        | Block_statement
        | Select_statement
 ;
syntax Null_statement
        = 
        "null" ";"
 ;
syntax Label
        = 
        "\<\<" Label_statement_identifier "\>\>"
 ;
syntax Statement_identifier
        = 
        Direct_name
 ;
syntax Assignment_statement
        = 
        Variable_name ":=" Expression ";"
 ;
syntax If_statement
        = 
        "if" Condition "then" Sequence_of_statements ("elsif" Condition "then" Sequence_of_statements)* ("else" Sequence_of_statements)? "end" "if" ";"
 ;
syntax Condition
        = 
        Boolean_expression
 ;
syntax Case_statement
        = 
        "case" Expression "is" Case_statement_alternative Case_statement_alternative* "end" "case" ";"
 ;
syntax Case_statement_alternative
        = 
        "when" Discrete_choice_list "=\>" Sequence_of_statements
 ;
syntax Loop_statement
        = 
        (Loop_statement_identifier ":")? Iteration_scheme? "loop" Sequence_of_statements "end" "loop" Loop_identifier? ";"
 ;
syntax Iteration_scheme
        = "while" Condition
        | "for" Loop_parameter_specification
 ;
syntax Loop_parameter_specification
        = 
        Defining_identifier "in" "reverse"? Discrete_subtype_definition
 ;
syntax Block_statement
        = 
        (Block_statement_identifier ":")? ("declare" Declarative_part)? "begin" Handled_sequence_of_statements "end" Block_identifier? ";"
 ;
syntax Exit_statement
        = 
        "exit" Loop_name? ("when" Condition)? ";"
 ;
syntax Goto_statement
        = 
        "goto" Label_name ";"
 ;
syntax Subprogram_declaration
        = 
        Overriding_indicator? Subprogram_specification ";"
 ;
syntax Subprogram_specification
        = Procedure_specification
        | Function_specification
 ;
syntax Procedure_specification
        = 
        "procedure" Defining_program_unit_name Parameter_profile
 ;
syntax Function_specification
        = 
        "function" Defining_designator Parameter_and_result_profile
 ;
syntax Designator
        = (Parent_unit_name ".")? Identifier
        | Operator_symbol
 ;
syntax Defining_designator
        = Defining_program_unit_name
        | Defining_operator_symbol
 ;
syntax Defining_program_unit_name
        = 
        (Parent_unit_name ".")? Defining_identifier
 ;
syntax Operator_symbol
        = 
        String_literal
 ;
syntax Defining_operator_symbol
        = 
        Operator_symbol
 ;
syntax Parameter_profile
        = 
        Formal_part?
 ;
syntax Parameter_and_result_profile
        = Formal_part? "return" Null_exclusion? Subtype_mark
        | Formal_part? "return" Access_definition
 ;
syntax Formal_part
        = 
        "(" Parameter_specification (";" Parameter_specification)* ")"
 ;
syntax Parameter_specification
        = Defining_identifier_list ":" Mode Null_exclusion? Subtype_mark (":=" Default_expression)?
        | Defining_identifier_list ":" Access_definition (":=" Default_expression)?
 ;
syntax Mode
        = "in"?
        | "in" "out"
        | "out"
 ;
syntax Subprogram_body
        = 
        Overriding_indicator? Subprogram_specification "is" Declarative_part "begin" Handled_sequence_of_statements "end" Designator? ";"
 ;
syntax Procedure_call_statement
        = Procedure_name ";"
        | Procedure_prefix Actual_parameter_part ";"
 ;
syntax Function_call
        = Function_name
        | Function_prefix Actual_parameter_part
 ;
syntax Actual_parameter_part
        = 
        "(" Parameter_association ("," Parameter_association)* ")"
 ;
syntax Parameter_association
        = 
        (Formal_parameter_selector_name "=\>")? Explicit_actual_parameter
 ;
syntax Explicit_actual_parameter
        = Expression
        | Variable_name
 ;
syntax Simple_return_statement
        = 
        "return" Expression? ";"
 ;
syntax Extended_return_statement
        = 
        "return" Defining_identifier ":" "aliased"? Return_subtype_indication (":=" Expression)? ("do" Handled_sequence_of_statements "end" "return")? ";"
 ;
syntax Return_subtype_indication
        = Subtype_indication
        | Access_definition
 ;
syntax Null_procedure_declaration
        = 
        Overriding_indicator? Procedure_specification "is" "null" ";"
 ;
syntax Package_declaration
        = 
        Package_specification ";"
 ;
syntax Package_specification
        = 
        "package" Defining_program_unit_name "is" Basic_declarative_item* ("private" Basic_declarative_item*)? "end" ((Parent_unit_name ".")? Identifier)?
 ;
syntax Package_body
        = 
        "package" "body" Defining_program_unit_name "is" Declarative_part ("begin" Handled_sequence_of_statements)? "end" ((Parent_unit_name ".")? Identifier)? ";"
 ;
syntax Private_type_declaration
        = 
        "type" Defining_identifier Discriminant_part? "is" ("abstract"? "tagged")? "limited"? "private" ";"
 ;
syntax Private_extension_declaration
        = 
        "type" Defining_identifier Discriminant_part? "is" "abstract"? ("limited" | "synchronized")? "new" Ancestor_subtype_indication ("and" Interface_list)? "with" "private" ";"
 ;
syntax Overriding_indicator
        = 
        "not"? "overriding"
 ;
syntax Use_clause
        = Use_package_clause
        | Use_type_clause
 ;
syntax Use_package_clause
        = 
        "use" Package_name ("," Package_name)* ";"
 ;
syntax Use_type_clause
        = 
        "use" "type" Subtype_mark ("," Subtype_mark)* ";"
 ;
syntax Renaming_declaration
        = Object_renaming_declaration
        | Exception_renaming_declaration
        | Package_renaming_declaration
        | Subprogram_renaming_declaration
        | Generic_renaming_declaration
 ;
syntax Object_renaming_declaration
        = Defining_identifier ":" Null_exclusion? Subtype_mark "renames" Object_name ";"
        | Defining_identifier ":" Access_definition "renames" Object_name ";"
 ;
syntax Exception_renaming_declaration
        = 
        Defining_identifier ":" "exception" "renames" Exception_name ";"
 ;
syntax Package_renaming_declaration
        = 
        "package" Defining_program_unit_name "renames" Package_name ";"
 ;
syntax Subprogram_renaming_declaration
        = 
        Overriding_indicator? Subprogram_specification "renames" Callable_entity_name ";"
 ;
syntax Generic_renaming_declaration
        = "generic" "package" Defining_program_unit_name "renames" Generic_package_name ";"
        | "generic" "procedure" Defining_program_unit_name "renames" Generic_procedure_name ";"
        | "generic" "function" Defining_program_unit_name "renames" Generic_function_name ";"
 ;
syntax Task_type_declaration
        = 
        "task" "type" Defining_identifier Known_discriminant_part? ("is" ("new" Interface_list "with")? Task_definition)? ";"
 ;
syntax Single_task_declaration
        = 
        "task" Defining_identifier ("is" ("new" Interface_list "with")? Task_definition)? ";"
 ;
syntax Task_definition
        = 
        Task_item* ("private" Task_item*)? "end" Task_identifier?
 ;
syntax Task_item
        = Entry_declaration
        | Aspect_clause
 ;
syntax Task_body
        = 
        "task" "body" Defining_identifier "is" Declarative_part "begin" Handled_sequence_of_statements "end" Task_identifier? ";"
 ;
syntax Protected_type_declaration
        = 
        "protected" "type" Defining_identifier Known_discriminant_part? "is" ("new" Interface_list "with")? Protected_definition ";"
 ;
syntax Single_protected_declaration
        = 
        "protected" Defining_identifier "is" ("new" Interface_list "with")? Protected_definition ";"
 ;
syntax Protected_definition
        = 
        Protected_operation_declaration* ("private" Protected_element_declaration*)? "end" Protected_identifier?
 ;
syntax Protected_operation_declaration
        = Subprogram_declaration
        | Entry_declaration
        | Aspect_clause
 ;
syntax Protected_element_declaration
        = Protected_operation_declaration
        | Component_declaration
 ;
syntax Protected_body
        = 
        "protected" "body" Defining_identifier "is" Protected_operation_item* "end" Protected_identifier? ";"
 ;
syntax Protected_operation_item
        = Subprogram_declaration
        | Subprogram_body
        | Entry_body
        | Aspect_clause
 ;
syntax Entry_declaration
        = 
        Overriding_indicator? "entry" Defining_identifier ("(" Discrete_subtype_definition ")")? Parameter_profile ";"
 ;
syntax Accept_statement
        = 
        "accept" Entry_direct_name ("(" Entry_index ")")? Parameter_profile ("do" Handled_sequence_of_statements "end" Entry_identifier?)? ";"
 ;
syntax Entry_index
        = 
        Expression
 ;
syntax Entry_body
        = 
        "entry" Defining_identifier Entry_body_formal_part Entry_barrier "is" Declarative_part "begin" Handled_sequence_of_statements "end" Entry_identifier? ";"
 ;
syntax Entry_body_formal_part
        = 
        ("(" Entry_index_specification ")")? Parameter_profile
 ;
syntax Entry_barrier
        = 
        "when" Condition
 ;
syntax Entry_index_specification
        = 
        "for" Defining_identifier "in" Discrete_subtype_definition
 ;
syntax Entry_call_statement
        = 
        Entry_name Actual_parameter_part? ";"
 ;
syntax Requeue_statement
        = 
        "requeue" Entry_name ("with" "abort")? ";"
 ;
syntax Delay_statement
        = Delay_until_statement
        | Delay_relative_statement
 ;
syntax Delay_until_statement
        = 
        "delay" "until" Delay_expression ";"
 ;
syntax Delay_relative_statement
        = 
        "delay" Delay_expression ";"
 ;
syntax Select_statement
        = Selective_accept
        | Timed_entry_call
        | Conditional_entry_call
        | Asynchronous_select
 ;
syntax Selective_accept
        = 
        "select" Guard? Select_alternative ("or" Guard? Select_alternative)* ("else" Sequence_of_statements)? "end" "select" ";"
 ;
syntax Guard
        = 
        "when" Condition "=\>"
 ;
syntax Select_alternative
        = Accept_alternative
        | Delay_alternative
        | Terminate_alternative
 ;
syntax Accept_alternative
        = 
        Accept_statement Sequence_of_statements?
 ;
syntax Delay_alternative
        = 
        Delay_statement Sequence_of_statements?
 ;
syntax Terminate_alternative
        = 
        "terminate" ";"
 ;
syntax Timed_entry_call
        = 
        "select" Entry_call_alternative "or" Delay_alternative "end" "select" ";"
 ;
syntax Entry_call_alternative
        = 
        Procedure_or_entry_call Sequence_of_statements?
 ;
syntax Procedure_or_entry_call
        = Procedure_call_statement
        | Entry_call_statement
 ;
syntax Conditional_entry_call
        = 
        "select" Entry_call_alternative "else" Sequence_of_statements "end" "select" ";"
 ;
syntax Asynchronous_select
        = 
        "select" Triggering_alternative "then" "abort" Abortable_part "end" "select" ";"
 ;
syntax Triggering_alternative
        = 
        Triggering_statement Sequence_of_statements?
 ;
syntax Triggering_statement
        = Procedure_or_entry_call
        | Delay_statement
 ;
syntax Abortable_part
        = 
        Sequence_of_statements
 ;
syntax Abort_statement
        = 
        "abort" Task_name ("," Task_name)* ";"
 ;
syntax Compilation
        = 
        Compilation_unit*
 ;
syntax Compilation_unit
        = Context_clause Library_item
        | Context_clause Subunit
 ;
syntax Library_item
        = "private"? Library_unit_declaration
        | Library_unit_body
        | "private"? Library_unit_renaming_declaration
 ;
syntax Library_unit_declaration
        = Subprogram_declaration
        | Package_declaration
        | Generic_declaration
        | Generic_instantiation
 ;
syntax Library_unit_renaming_declaration
        = Package_renaming_declaration
        | Generic_renaming_declaration
        | Subprogram_renaming_declaration
 ;
syntax Library_unit_body
        = Subprogram_body
        | Package_body
 ;
syntax Parent_unit_name
        = 
        Name
 ;
syntax Context_clause
        = 
        Context_item*
 ;
syntax Context_item
        = With_clause
        | Use_clause
 ;
syntax With_clause
        = Limited_with_clause
        | Nonlimited_with_clause
 ;
syntax Limited_with_clause
        = 
        "limited" "private"? "with" Library_unit_name ("," Library_unit_name)* ";"
 ;
syntax Nonlimited_with_clause
        = 
        "private"? "with" Library_unit_name ("," Library_unit_name)* ";"
 ;
syntax Body_stub
        = Subprogram_body_stub
        | Package_body_stub
        | Task_body_stub
        | Protected_body_stub
 ;
syntax Subprogram_body_stub
        = 
        Overriding_indicator? Subprogram_specification "is" "separate" ";"
 ;
syntax Package_body_stub
        = 
        "package" "body" Defining_identifier "is" "separate" ";"
 ;
syntax Task_body_stub
        = 
        "task" "body" Defining_identifier "is" "separate" ";"
 ;
syntax Protected_body_stub
        = 
        "protected" "body" Defining_identifier "is" "separate" ";"
 ;
syntax Subunit
        = 
        "separate" "(" Parent_unit_name ")" Proper_body
 ;
syntax Exception_declaration
        = 
        Defining_identifier_list ":" "exception" ";"
 ;
syntax Handled_sequence_of_statements
        = 
        Sequence_of_statements ("exception" Exception_handler Exception_handler*)?
 ;
syntax Exception_handler
        = 
        "when" (Choice_parameter_specification ":")? Exception_choice ("|" Exception_choice)* "=\>" Sequence_of_statements
 ;
syntax Choice_parameter_specification
        = 
        Defining_identifier
 ;
syntax Exception_choice
        = Exception_name
        | "others"
 ;
syntax Raise_statement
        = "raise" ";"
        | "raise" Exception_name ("with" String_expression)? ";"
 ;
syntax Generic_declaration
        = Generic_subprogram_declaration
        | Generic_package_declaration
 ;
syntax Generic_subprogram_declaration
        = 
        Generic_formal_part Subprogram_specification ";"
 ;
syntax Generic_package_declaration
        = 
        Generic_formal_part Package_specification ";"
 ;
syntax Generic_formal_part
        = 
        "generic" (Generic_formal_parameter_declaration | Use_clause)*
 ;
syntax Generic_formal_parameter_declaration
        = Formal_object_declaration
        | Formal_type_declaration
        | Formal_subprogram_declaration
        | Formal_package_declaration
 ;
syntax Generic_instantiation
        = "package" Defining_program_unit_name "is" "new" Generic_package_name Generic_actual_part? ";"
        | Overriding_indicator? "procedure" Defining_program_unit_name "is" "new" Generic_procedure_name Generic_actual_part? ";"
        | Overriding_indicator? "function" Defining_designator "is" "new" Generic_function_name Generic_actual_part? ";"
 ;
syntax Generic_actual_part
        = 
        "(" Generic_association ("," Generic_association)* ")"
 ;
syntax Generic_association
        = 
        (Generic_formal_parameter_selector_name "=\>")? Explicit_generic_actual_parameter
 ;
syntax Explicit_generic_actual_parameter
        = Expression
        | Variable_name
        | Subprogram_name
        | Entry_name
        | Subtype_mark
        | Package_instance_name
 ;
syntax Formal_object_declaration
        = 
        Defining_identifier_list ":" Mode Null_exclusion? Subtype_mark (":=" Default_expression)? ";" Defining_identifier_list ":" Mode Access_definition (":=" Default_expression)? ";"
 ;
syntax Formal_type_declaration
        = 
        "type" Defining_identifier Discriminant_part? "is" Formal_type_definition ";"
 ;
syntax Formal_type_definition
        = Formal_private_type_definition
        | Formal_derived_type_definition
        | Formal_discrete_type_definition
        | Formal_signed_integer_type_definition
        | Formal_modular_type_definition
        | Formal_floating_point_definition
        | Formal_ordinary_fixed_point_definition
        | Formal_decimal_fixed_point_definition
        | Formal_array_type_definition
        | Formal_access_type_definition
        | Formal_interface_type_definition
 ;
syntax Formal_private_type_definition
        = 
        ("abstract"? "tagged")? "limited"? "private"
 ;
syntax Formal_derived_type_definition
        = 
        "abstract"? ("limited" | "synchronized")? "new" Subtype_mark (("and" Interface_list)? "with" "private")?
 ;
syntax Formal_discrete_type_definition
        = 
        "(\<\>)"
 ;
syntax Formal_signed_integer_type_definition
        = 
        "range" "\<\>"
 ;
syntax Formal_modular_type_definition
        = 
        "mod" "\<\>"
 ;
syntax Formal_floating_point_definition
        = 
        "digits" "\<\>"
 ;
syntax Formal_ordinary_fixed_point_definition
        = 
        "delta" "\<\>"
 ;
syntax Formal_decimal_fixed_point_definition
        = 
        "delta" "\<\>" "digits" "\<\>"
 ;
syntax Formal_array_type_definition
        = 
        Array_type_definition
 ;
syntax Formal_access_type_definition
        = 
        Access_type_definition
 ;
syntax Formal_interface_type_definition
        = 
        Interface_type_definition
 ;
syntax Formal_subprogram_declaration
        = Formal_concrete_subprogram_declaration
        | Formal_abstract_subprogram_declaration
 ;
syntax Formal_concrete_subprogram_declaration
        = 
        "with" Subprogram_specification ("is" Subprogram_default)? ";"
 ;
syntax Formal_abstract_subprogram_declaration
        = 
        "with" Subprogram_specification "is" "abstract" Subprogram_default? ";"
 ;
syntax Subprogram_default
        = Default_name
        | "\<\>"
        | "null"
 ;
syntax Default_name
        = 
        Name
 ;
syntax Formal_package_declaration
        = 
        "with" "package" Defining_identifier "is" "new" Generic_package_name Formal_package_actual_part ";"
 ;
syntax Formal_package_actual_part
        = "(" ("others" "=\>")? "\<\>)"
        | Generic_actual_part?
        | "(" Formal_package_association ("," Formal_package_association)* ("," "others" "=\>\<\>")? ")"
 ;
syntax Formal_package_association
        = Generic_association
        | Generic_formal_parameter_selector_name "=\>\<\>"
 ;
syntax Aspect_clause
        = Attribute_definition_clause
        | Enumeration_representation_clause
        | Record_representation_clause
        | At_clause
 ;
syntax Local_name
        = Direct_name
        | Direct_name "'" Attribute_designator
        | Library_unit_name
 ;
syntax Attribute_definition_clause
        = "for" Local_name "'" Attribute_designator "use" Expression ";"
        | "for" Local_name "'" Attribute_designator "use" Name ";"
 ;
syntax Enumeration_representation_clause
        = 
        "for" First_subtype_local_name "use" Enumeration_aggregate ";"
 ;
syntax Enumeration_aggregate
        = 
        Array_aggregate
 ;
syntax Record_representation_clause
        = 
        "for" First_subtype_local_name "use" "record" Mod_clause? Component_clause* "end" "record" ";"
 ;
syntax Component_clause
        = 
        Component_local_name "at" Position "range" First_bit ".." Last_bit ";"
 ;
syntax Position
        = 
        Static_expression
 ;
syntax First_bit
        = 
        Static_simple_expression
 ;
syntax Last_bit
        = 
        Static_simple_expression
 ;
syntax Code_statement
        = 
        Qualified_expression ";"
 ;
syntax Restriction
        = Restriction_identifier
        | Restriction_parameter_identifier "=\>" Restriction_parameter_argument
 ;
syntax Restriction_parameter_argument
        = Name
        | Expression
 ;
syntax Delta_constraint
        = 
        "delta" Static_expression Range_constraint?
 ;
syntax At_clause
        = 
        "for" Direct_name "use" "at" Expression ";"
 ;
syntax Mod_clause
        = 
        "at" "mod" Static_expression ";"
 ;
syntax Non_quotation_mark_graphic_character
        = 
        Graphic_character
 ;
syntax Non_end_of_line_character
        = 
        "character"
 ;
syntax Pragma_argument_identifier
        = 
        Identifier
 ;
syntax Subtype_name
        = 
        Name
 ;
syntax Static_expression
        = 
        Expression
 ;
syntax Parent_subtype_indication
        = 
        Subtype_indication
 ;
syntax Static_simple_expression
        = 
        Simple_expression
 ;
syntax Discrete_subtype_indication
        = 
        Subtype_indication
 ;
syntax Discriminant_selector_name
        = 
        Selector_name
 ;
syntax Discriminant_direct_name
        = 
        Direct_name
 ;
syntax Interface_subtype_mark
        = 
        Subtype_mark
 ;
syntax Component_selector_name
        = 
        Selector_name
 ;
syntax Label_statement_identifier
        = 
        Statement_identifier
 ;
syntax Variable_name
        = 
        Name
 ;
syntax Boolean_expression
        = 
        Expression
 ;
syntax Loop_statement_identifier
        = 
        Statement_identifier
 ;
syntax Loop_identifier
        = 
        Identifier
 ;
syntax Block_statement_identifier
        = 
        Statement_identifier
 ;
syntax Block_identifier
        = 
        Identifier
 ;
syntax Loop_name
        = 
        Name
 ;
syntax Label_name
        = 
        Name
 ;
syntax Procedure_name
        = 
        Name
 ;
syntax Procedure_prefix
        = 
        Prefix
 ;
syntax Function_name
        = 
        Name
 ;
syntax Function_prefix
        = 
        Prefix
 ;
syntax Formal_parameter_selector_name
        = 
        Selector_name
 ;
syntax Ancestor_subtype_indication
        = 
        Subtype_indication
 ;
syntax Package_name
        = 
        Name
 ;
syntax Object_name
        = 
        Name
 ;
syntax Exception_name
        = 
        Name
 ;
syntax Callable_entity_name
        = 
        Name
 ;
syntax Generic_package_name
        = 
        Name
 ;
syntax Generic_procedure_name
        = 
        Name
 ;
syntax Generic_function_name
        = 
        Name
 ;
syntax Task_identifier
        = 
        Identifier
 ;
syntax Protected_identifier
        = 
        Identifier
 ;
syntax Entry_direct_name
        = 
        Direct_name
 ;
syntax Entry_identifier
        = 
        Identifier
 ;
syntax Entry_name
        = 
        Name
 ;
syntax Delay_expression
        = 
        Expression
 ;
syntax Task_name
        = 
        Name
 ;
syntax Library_unit_name
        = 
        Name
 ;
syntax String_expression
        = 
        Expression
 ;
syntax Generic_formal_parameter_selector_name
        = 
        Selector_name
 ;
syntax Subprogram_name
        = 
        Name
 ;
syntax Package_instance_name
        = 
        Name
 ;
syntax First_subtype_local_name
        = 
        Local_name
 ;
syntax Component_local_name
        = 
        Local_name
 ;
syntax Restriction_identifier
        = 
        Identifier
 ;
syntax Restriction_parameter_identifier
        = 
        Identifier
 ;
