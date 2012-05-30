@contributor{bgf2src automated exporter - SLPS}
module Kellogg

syntax Compilation_unit
        = 
        Context_items_opt (Library_item | Subunit) Pragma*
 ;
syntax Pragma
        = 
        PRAGMA IDENTIFIER Pragma_args_opt SEMI
 ;
syntax Pragma_args_opt
        = 
        (LPAREN Pragma_arg (COMMA Pragma_arg)* RPAREN)?
 ;
syntax Pragma_arg
        = 
        (IDENTIFIER RIGHT_SHAFT)? Expression
 ;
syntax Context_items_opt
        = 
        Pragma* (With_clause (Use_clause | Pragma)*)*
 ;
syntax With_clause
        = 
        WITH w C_name_list SEMI
 ;
syntax C_name_list
        = 
        Compound_name (COMMA Compound_name)*
 ;
syntax Compound_name
        = 
        IDENTIFIER (DOT IDENTIFIER)*
 ;
syntax Use_clause
        = 
        USE u ((TYPE Subtype_mark (COMMA Subtype_mark)*) | C_name_list) SEMI
 ;
syntax Subtype_mark
        = 
        Compound_name (TIC Attribute_id)?
 ;
syntax Attribute_id
        = RANGE
        | DIGITS
        | DELTA
        | ACCESS
        | IDENTIFIER
 ;
syntax Library_item
        = 
        Private_opt (Lib_pkg_spec_or_body | Subprog_decl_or_rename_or_inst_or_body | Generic_decl)
 ;
syntax Private_opt
        = 
        PRIVATE?
 ;
syntax Lib_pkg_spec_or_body
        = 
        PACKAGE pkg ((BODY Def_id IS Pkg_body_part End_id_opt SEMI) | (Def_id Spec_decl_part))
 ;
syntax Subprog_decl
        = PROCEDURE p Def_id (Generic_subp_inst | (Formal_part_opt (Renames | Is_separate_or_abstract_or_decl) SEMI))
        | FUNCTION f Def_designator (Generic_subp_inst | (Function_tail (Renames | Is_separate_or_abstract_or_decl) SEMI))
 ;
syntax Def_id
        = cn: Compound_name
        | n: IDENTIFIER
 ;
syntax Generic_subp_inst
        = 
        IS Generic_inst SEMI
 ;
syntax Generic_inst
        = 
        NEW Compound_name (LPAREN Value_s RPAREN)?
 ;
syntax Parenth_values
        = 
        LPAREN Value (COMMA Value)* RPAREN
 ;
syntax Value
        = OTHERS RIGHT_SHAFT Expression
        | Ranged_expr_s (RIGHT_SHAFT Expression)?
 ;
syntax Ranged_expr_s
        = 
        Ranged_expr (PIPE Ranged_expr)*
 ;
syntax Ranged_expr
        = 
        Expression ((DOT_DOT Simple_expression) | (RANGE Range))?
 ;
syntax Range_constraint
        = 
        RANGE Range
 ;
syntax Range
        = Range_dots
        | Range_attrib_ref
 ;
syntax Range_dots
        = 
        Simple_expression DOT_DOT Simple_expression
 ;
syntax Range_attrib_ref
        = 
        Prefix TIC RANGE r (LPAREN Expression RPAREN)?
 ;
syntax Prefix
        = 
        IDENTIFIER ((DOT (ALL | IDENTIFIER)) | (LPAREN p Value_s RPAREN))*
 ;
syntax Formal_part_opt
        = 
        (LPAREN Parameter_specification (SEMI Parameter_specification)* RPAREN)?
 ;
syntax Parameter_specification
        = 
        Def_ids_colon Mode_opt Subtype_mark Init_opt
 ;
syntax Def_ids_colon
        = 
        Defining_identifier_list COLON
 ;
syntax Defining_identifier_list
        = 
        IDENTIFIER (COMMA IDENTIFIER)*
 ;
syntax Mode_opt
        = 
        ((IN OUT?) | OUT | ACCESS)?
 ;
syntax Renames
        = 
        RENAMES (Name | Definable_operator_symbol dummy)
 ;
syntax Name
        = 
        IDENTIFIER ((DOT (ALL | IDENTIFIER | CHARACTER_LITERAL | Is_operator dummy)) | (LPAREN p Value_s RPAREN) | (TIC Attribute_id))*
 ;
syntax Is_operator
        = 
        op: CHAR_STRING
 ;
syntax Definable_operator_symbol
        = 
        op: CHAR_STRING
 ;
syntax Parenthesized_primary
        = 
        LPAREN pp ((NuLL RECORD) | (Value_s Extension_opt)) RPAREN
 ;
syntax Extension_opt
        = 
        (WITH ((NuLL RECORD) | Value_s))?
 ;
syntax Is_separate_or_abstract_or_decl
        = IS Separate_or_abstract
        | ()
 ;
syntax Separate_or_abstract
        = SEPARATE
        | ABSTRACT
 ;
syntax Def_designator
        = n: Compound_name
        | d: Designator
 ;
syntax Designator
        = op: Definable_operator_symbol
        | n: IDENTIFIER
 ;
syntax Function_tail
        = 
        Func_formal_part_opt RETURN Subtype_mark
 ;
syntax Func_formal_part_opt
        = 
        (LPAREN Func_param (SEMI Func_param)* RPAREN)?
 ;
syntax Func_param
        = 
        Def_ids_colon In_access_opt Subtype_mark Init_opt
 ;
syntax In_access_opt
        = 
        (IN | ACCESS)?
 ;
syntax Spec_decl_part
        = 
        ((IS (Generic_inst | Pkg_spec_part)) | Renames) SEMI
 ;
syntax Pkg_spec_part
        = 
        Basic_declarative_items_opt (PRIVATE Basic_declarative_items_opt)? End_id_opt
 ;
syntax Basic_declarative_items_opt
        = 
        (Basic_decl_item | Pragma)*
 ;
syntax Basic_declarative_items
        = 
        (Basic_decl_item | Pragma)+
 ;
syntax Basic_decl_item
        = PACKAGE pkg Def_id Spec_decl_part
        | TASK tsk Task_type_or_single_decl
        | PROTECTED pro Prot_type_or_single_decl SEMI
        | Subprog_decl
        | Decl_common
 ;
syntax Task_type_or_single_decl
        = TYPE Def_id Discrim_part_opt Task_definition_opt
        | Def_id Task_definition_opt
 ;
syntax Task_definition_opt
        = IS Task_items_opt Private_task_items_opt End_id_opt SEMI
        | SEMI
 ;
syntax Discrim_part_opt
        = 
        Discrim_part_text?
 ;
syntax Discrim_part_text
        = 
        LPAREN (BOX | Discriminant_specifications) RPAREN
 ;
syntax Known_discrim_part
        = 
        LPAREN Discriminant_specifications RPAREN
 ;
syntax Empty_discrim_opt
        = 
        ()
 ;
syntax Discrim_part
        = 
        Discrim_part_text
 ;
syntax Discriminant_specifications
        = 
        Discriminant_specification (SEMI Discriminant_specification)*
 ;
syntax Discriminant_specification
        = 
        Def_ids_colon Access_opt Subtype_mark Init_opt
 ;
syntax Access_opt
        = 
        ACCESS?
 ;
syntax Init_opt
        = 
        (ASSIGN Expression)?
 ;
syntax Task_items_opt
        = 
        Pragma* Entrydecls_repspecs_opt
 ;
syntax Entrydecls_repspecs_opt
        = 
        (Entry_declaration (Pragma | Rep_spec)*)*
 ;
syntax Entry_declaration
        = 
        ENTRY e IDENTIFIER Discrete_subtype_def_opt Formal_part_opt SEMI
 ;
syntax Discrete_subtype_def_opt
        = LPAREN Discrete_subtype_definition
        | ()
 ;
syntax Discrete_subtype_definition
        = Range
        | Subtype_ind
 ;
syntax Rep_spec
        = 
        FOR r Subtype_mark USE Rep_spec_part SEMI
 ;
syntax Rep_spec_part
        = RECORD Align_opt Comp_loc_s END RECORD
        | AT Expression
        | Expression
 ;
syntax Align_opt
        = 
        (AT MOD Expression SEMI)?
 ;
syntax Comp_loc_s
        = 
        (Pragma | (Subtype_mark AT Expression RANGE Range SEMI))*
 ;
syntax Private_task_items_opt
        = 
        (PRIVATE Pragma* Entrydecls_repspecs_opt)?
 ;
syntax Prot_type_or_single_decl
        = TYPE Def_id Discrim_part_opt Protected_definition
        | Def_id Protected_definition
 ;
syntax Protected_definition
        = 
        IS Prot_op_decl_s (PRIVATE Prot_member_decl_s)? End_id_opt
 ;
syntax Prot_op_decl_s
        = 
        Prot_op_decl*
 ;
syntax Prot_op_decl
        = Entry_declaration
        | PROCEDURE p Def_id Formal_part_opt SEMI
        | FUNCTION f Def_designator Function_tail SEMI
        | Rep_spec
        | Pragma
 ;
syntax Prot_member_decl_s
        = 
        (Prot_op_decl | Comp_decl)*
 ;
syntax Comp_decl
        = 
        Def_ids_colon Component_subtype_def Init_opt SEMI
 ;
syntax Decl_common
        = TYPE t IDENTIFIER ((IS Type_def) | (Discrim_part ((IS Derived_or_private_or_record) | ())) | Empty_discrim_opt) SEMI
        | SUBTYPE s IDENTIFIER IS Subtype_ind SEMI
        | Generic_decl
        | Use_clause
        | FOR r ((Local_enum_name USE) | (Subtype_mark USE Rep_spec_part)) SEMI
        | IDENTIFIER COLON erd EXCEPTION RENAMES Compound_name
        | IDENTIFIER COLON ord Subtype_mark RENAMES Name
        | Defining_identifier_list COLON od (EXCEPTION | (CONSTANT ASSIGN) | (Aliased_constant_opt ((Array_type_definition Init_opt) | (Subtype_ind Init_opt)))) SEMI
 ;
syntax Type_def
        = LPAREN Enum_id_s RPAREN
        | RANGE Range
        | MOD Expression
        | DIGITS Expression Range_constraint_opt
        | DELTA Expression ((RANGE Range) | (DIGITS Expression Range_constraint_opt))
        | Array_type_definition
        | Access_type_definition
        | Empty_discrim_opt Derived_or_private_or_record
 ;
syntax Enum_id_s
        = 
        Enumeration_literal_specification (COMMA Enumeration_literal_specification)*
 ;
syntax Enumeration_literal_specification
        = IDENTIFIER
        | CHARACTER_LITERAL
 ;
syntax Range_constraint_opt
        = 
        Range_constraint?
 ;
syntax Array_type_definition
        = 
        ARRAY LPAREN Index_or_discrete_range_s RPAREN OF Component_subtype_def
 ;
syntax Index_or_discrete_range_s
        = 
        Index_or_discrete_range (COMMA Index_or_discrete_range)*
 ;
syntax Index_or_discrete_range
        = 
        Simple_expression ((DOT_DOT Simple_expression) | (RANGE (BOX | Range)))?
 ;
syntax Component_subtype_def
        = 
        Aliased_opt Subtype_ind
 ;
syntax Aliased_opt
        = 
        ALIASED?
 ;
syntax Subtype_ind
        = 
        Subtype_mark Constraint_opt
 ;
syntax Constraint_opt
        = 
        (Range_constraint | Digits_constraint | Delta_constraint | Index_constraint | Discriminant_constraint)?
 ;
syntax Digits_constraint
        = 
        DIGITS d Expression Range_constraint_opt
 ;
syntax Delta_constraint
        = 
        DELTA d Expression Range_constraint_opt
 ;
syntax Index_constraint
        = 
        LPAREN p Discrete_range (COMMA Discrete_range)* RPAREN
 ;
syntax Discrete_range
        = Range
        | Subtype_ind
 ;
syntax Discriminant_constraint
        = 
        LPAREN p Discriminant_association (COMMA Discriminant_association)* RPAREN
 ;
syntax Discriminant_association
        = 
        Selector_names_opt Expression
 ;
syntax Selector_names_opt
        = Association_head
        | ()
 ;
syntax Association_head
        = 
        Selector_name (PIPE Selector_name)* RIGHT_SHAFT
 ;
syntax Selector_name
        = 
        IDENTIFIER
 ;
syntax Access_type_definition
        = 
        ACCESS ((Protected_opt ((PROCEDURE Formal_part_opt) | (FUNCTION Func_formal_part_opt RETURN Subtype_mark))) | (Constant_all_opt Subtype_ind))
 ;
syntax Protected_opt
        = 
        PROTECTED?
 ;
syntax Constant_all_opt
        = 
        (CONSTANT | ALL)?
 ;
syntax Derived_or_private_or_record
        = Abstract_opt NEW Subtype_ind WITH
        | NEW Subtype_ind
        | Abstract_tagged_limited_opt (PRIVATE | Record_definition)
 ;
syntax Abstract_opt
        = 
        ABSTRACT?
 ;
syntax Record_definition
        = RECORD Component_list END RECORD
        | NuLL RECORD
 ;
syntax Component_list
        = NuLL SEMI
        | Component_items Variant_part?
        | Empty_component_items Variant_part
 ;
syntax Component_items
        = 
        (Pragma | Comp_decl)+
 ;
syntax Empty_component_items
        = 
        ()
 ;
syntax Variant_part
        = 
        CASE c Discriminant_direct_name IS Variant_s END CASE SEMI
 ;
syntax Discriminant_direct_name
        = 
        IDENTIFIER
 ;
syntax Variant_s
        = 
        Variant+
 ;
syntax Variant
        = 
        WHEN w Choice_s RIGHT_SHAFT Component_list
 ;
syntax Choice_s
        = 
        Choice (PIPE Choice)*
 ;
syntax Choice
        = OTHERS
        | Discrete_with_range
        | Expression
 ;
syntax Discrete_with_range
        = Mark_with_constraint
        | Range
 ;
syntax Mark_with_constraint
        = 
        Subtype_mark Range_constraint
 ;
syntax Abstract_tagged_limited_opt
        = 
        ((ABSTRACT TAGGED) | TAGGED)? LIMITED?
 ;
syntax Local_enum_name
        = 
        IDENTIFIER
 ;
syntax Enumeration_aggregate
        = 
        Parenth_values
 ;
syntax Aliased_constant_opt
        = 
        ALIASED? CONSTANT?
 ;
syntax Generic_decl
        = 
        GENERIC g Generic_formal_part_opt ((PACKAGE Def_id (Renames | (IS Pkg_spec_part))) | (PROCEDURE Def_id Formal_part_opt (Renames | ())) | (FUNCTION Def_designator Function_tail (Renames | ()))) SEMI
 ;
syntax Generic_formal_part_opt
        = 
        (Use_clause | Pragma | Generic_formal_parameter)*
 ;
syntax Generic_formal_parameter
        = 
        ((TYPE t Def_id ((IS ((LPAREN BOX RPAREN) | (RANGE BOX) | (MOD BOX) | (DELTA BOX ((DIGITS BOX) | ())) | (DIGITS BOX) | Array_type_definition | Access_type_definition | (Empty_discrim_opt Discriminable_type_definition))) | (Discrim_part IS Discriminable_type_definition))) | (WITH w ((PROCEDURE Def_id Formal_part_opt Subprogram_default_opt) | (FUNCTION Def_designator Function_tail Subprogram_default_opt) | (PACKAGE Def_id IS NEW Compound_name Formal_package_actual_part_opt))) | Parameter_specification) SEMI
 ;
syntax Discriminable_type_definition
        = Abstract_opt NEW Subtype_ind WITH
        | NEW Subtype_ind
        | Abstract_tagged_limited_opt PRIVATE
 ;
syntax Subprogram_default_opt
        = 
        (IS (BOX | Name))?
 ;
syntax Formal_package_actual_part_opt
        = 
        (LPAREN (BOX | Defining_identifier_list) RPAREN)?
 ;
syntax Subprog_decl_or_rename_or_inst_or_body
        = PROCEDURE p Def_id (Generic_subp_inst | (Formal_part_opt (Renames | (IS (Separate_or_abstract | Body_part)) | ()) SEMI))
        | FUNCTION f Def_designator (Generic_subp_inst | (Function_tail (Renames | (IS (Separate_or_abstract | Body_part)) | ()) SEMI))
 ;
syntax Body_part
        = 
        Declarative_part Block_body End_id_opt
 ;
syntax Declarative_part
        = 
        (Pragma | Declarative_item)*
 ;
syntax Declarative_item
        = PACKAGE pkg ((Body_is (Separate | (Pkg_body_part End_id_opt)) SEMI) | (Def_id Spec_decl_part))
        | TASK tsk ((Body_is (Separate | Body_part) SEMI) | Task_type_or_single_decl)
        | PROTECTED pro ((Body_is (Separate | (Prot_op_bodies_opt End_id_opt))) | Prot_type_or_single_decl) SEMI
        | Subprog_decl_or_rename_or_inst_or_body
        | Decl_common
 ;
syntax Body_is
        = 
        BODY Def_id IS
 ;
syntax Separate
        = 
        SEPARATE
 ;
syntax Pkg_body_part
        = 
        Declarative_part Block_body_opt
 ;
syntax Block_body_opt
        = 
        (BEGIN Handled_stmt_s)?
 ;
syntax Prot_op_bodies_opt
        = 
        (Entry_body | Subprog_decl_or_body | Pragma)*
 ;
syntax Subprog_decl_or_body
        = PROCEDURE p Def_id Formal_part_opt ((IS Body_part) | ()) SEMI
        | FUNCTION f Def_designator Function_tail ((IS Body_part) | ()) SEMI
 ;
syntax Block_body
        = 
        BEGIN b Handled_stmt_s
 ;
syntax Handled_stmt_s
        = 
        Statements Except_handler_part_opt
 ;
syntax Statements
        = 
        (Pragma | Statement)+
 ;
syntax Statement
        = 
        Def_label_opt (Null_stmt | Exit_stmt | Return_stmt | Goto_stmt | Delay_stmt | Abort_stmt | Raise_stmt | Requeue_stmt | Accept_stmt | Select_stmt | If_stmt | Case_stmt | (Loop_stmt SEMI) | (Block END SEMI) | (Statement_identifier ((Loop_stmt Id_opt SEMI) | (Block End_id_opt SEMI))) | Call_or_assignment)
 ;
syntax Def_label_opt
        = 
        (LT_LT IDENTIFIER GT_GT)?
 ;
syntax Null_stmt
        = 
        NuLL s SEMI
 ;
syntax If_stmt
        = 
        IF s Cond_clause Elsifs_opt Else_opt END IF SEMI
 ;
syntax Cond_clause
        = 
        Condition THEN c Statements
 ;
syntax Condition
        = 
        Expression
 ;
syntax Elsifs_opt
        = 
        (ELSIF Cond_clause)*
 ;
syntax Else_opt
        = 
        (ELSE Statements)?
 ;
syntax Case_stmt
        = 
        CASE s Expression IS Alternative_s END CASE SEMI
 ;
syntax Alternative_s
        = 
        Case_statement_alternative+
 ;
syntax Case_statement_alternative
        = 
        WHEN s Choice_s RIGHT_SHAFT Statements
 ;
syntax Loop_stmt
        = 
        Iteration_scheme_opt LOOP Statements END LOOP
 ;
syntax Iteration_scheme_opt
        = 
        ((WHILE Condition) | (FOR IDENTIFIER IN Reverse_opt Discrete_subtype_definition))?
 ;
syntax Reverse_opt
        = 
        REVERSE?
 ;
syntax Id_opt
        = endid: Definable_operator_symbol
        | n: Compound_name
        | ()
 ;
syntax End_id_opt
        = 
        END Id_opt
 ;
syntax Statement_identifier
        = 
        IDENTIFIER n COLON
 ;
syntax Block
        = 
        Declare_opt Block_body
 ;
syntax Declare_opt
        = 
        (DECLARE Declarative_part)?
 ;
syntax Exit_stmt
        = 
        EXIT s Label_name? (WHEN Condition)? SEMI
 ;
syntax Label_name
        = 
        IDENTIFIER
 ;
syntax Return_stmt
        = 
        RETURN s Expression? SEMI
 ;
syntax Goto_stmt
        = 
        GOTO s Label_name SEMI
 ;
syntax Call_or_assignment
        = 
        Name ((ASSIGN Expression) | ()) SEMI
 ;
syntax Entry_body
        = 
        ENTRY e Def_id Entry_body_formal_part Entry_barrier IS Body_part SEMI
 ;
syntax Entry_body_formal_part
        = 
        Entry_index_spec_opt Formal_part_opt
 ;
syntax Entry_index_spec_opt
        = LPAREN FOR Def_id IN Discrete_subtype_definition
        | ()
 ;
syntax Entry_barrier
        = 
        WHEN Condition
 ;
syntax Entry_call_stmt
        = 
        Name SEMI
 ;
syntax Accept_stmt
        = 
        ACCEPT a Def_id Entry_index_opt Formal_part_opt ((DO Handled_stmt_s End_id_opt SEMI) | SEMI)
 ;
syntax Entry_index_opt
        = LPAREN Expression
        | ()
 ;
syntax Delay_stmt
        = 
        DELAY d Until_opt Expression SEMI
 ;
syntax Until_opt
        = 
        UNTIL?
 ;
syntax Select_stmt
        = 
        SELECT s ((Triggering_alternative THEN ABORT) | Selective_accept | (Entry_call_alternative ((OR Delay_alternative) | (ELSE Statements)))) END SELECT SEMI
 ;
syntax Triggering_alternative
        = 
        (Delay_stmt | Entry_call_stmt) Stmts_opt
 ;
syntax Abortable_part
        = 
        Stmts_opt
 ;
syntax Entry_call_alternative
        = 
        Entry_call_stmt Stmts_opt
 ;
syntax Selective_accept
        = 
        Guard_opt Select_alternative Or_select_opt Else_opt
 ;
syntax Guard_opt
        = 
        (WHEN Condition RIGHT_SHAFT Pragma*)?
 ;
syntax Select_alternative
        = Accept_alternative
        | Delay_alternative
        | TERMINATE t SEMI
 ;
syntax Accept_alternative
        = 
        Accept_stmt Stmts_opt
 ;
syntax Delay_alternative
        = 
        Delay_stmt Stmts_opt
 ;
syntax Stmts_opt
        = 
        (Pragma | Statement)*
 ;
syntax Or_select_opt
        = 
        (OR Guard_opt Select_alternative)*
 ;
syntax Abort_stmt
        = 
        ABORT a Name (COMMA Name)* SEMI
 ;
syntax Except_handler_part_opt
        = 
        (EXCEPTION Exception_handler+)?
 ;
syntax Exception_handler
        = 
        WHEN w Identifier_colon_opt Except_choice_s RIGHT_SHAFT Statements
 ;
syntax Identifier_colon_opt
        = 
        (IDENTIFIER COLON)?
 ;
syntax Except_choice_s
        = 
        Exception_choice (PIPE Exception_choice)*
 ;
syntax Exception_choice
        = Compound_name
        | OTHERS
 ;
syntax Raise_stmt
        = 
        RAISE r Compound_name? SEMI
 ;
syntax Requeue_stmt
        = 
        REQUEUE r Name (WITH ABORT)? SEMI
 ;
syntax Operator_call
        = 
        CHAR_STRING cs Operator_call_tail
 ;
syntax Operator_call_tail
        = 
        LPAREN Value_s RPAREN
 ;
syntax Value_s
        = 
        Value (COMMA Value)*
 ;
syntax Expression
        = 
        Relation ((AND a THEN? Relation) | (OR o ELSE? Relation) | (XOR Relation))*
 ;
syntax Relation
        = 
        Simple_expression ((IN Range_or_mark) | (NOT n IN Range_or_mark) | (EQ Simple_expression) | (NE Simple_expression) | (LT_ Simple_expression) | (LE Simple_expression) | (GT Simple_expression) | (GE Simple_expression))?
 ;
syntax Range_or_mark
        = Range
        | Subtype_mark
 ;
syntax Simple_expression
        = 
        Signed_term ((PLUS Signed_term) | (MINUS Signed_term) | (CONCAT Signed_term))*
 ;
syntax Signed_term
        = PLUS p Term
        | MINUS m Term
        | Term
 ;
syntax Term
        = 
        Factor ((STAR Factor) | (DIV Factor) | (MOD Factor) | (REM Factor))*
 ;
syntax Factor
        = NOT Primary
        | ABS Primary
        | Primary (EXPON Primary)?
 ;
syntax Primary
        = Name_or_qualified
        | Parenthesized_primary
        | Allocator
        | NuLL
        | NUMERIC_LIT
        | CHARACTER_LITERAL
        | CHAR_STRING cs Operator_call_tail?
 ;
syntax Name_or_qualified
        = 
        IDENTIFIER ((DOT (ALL | IDENTIFIER | CHARACTER_LITERAL | Is_operator dummy)) | (LPAREN p Value_s RPAREN) | (TIC (Parenthesized_primary | Attribute_id)))*
 ;
syntax Allocator
        = 
        NEW n Name_or_qualified
 ;
syntax Subunit
        = 
        SEPARATE sep LPAREN Compound_name RPAREN (Subprogram_body | Package_body | Task_body | Protected_body)
 ;
syntax Subprogram_body
        = PROCEDURE p Def_id Formal_part_opt IS Body_part SEMI
        | FUNCTION f Function_tail IS Body_part SEMI
 ;
syntax Package_body
        = 
        PACKAGE p Body_is Pkg_body_part End_id_opt SEMI
 ;
syntax Task_body
        = 
        TASK t Body_is Body_part SEMI
 ;
syntax Protected_body
        = 
        PROTECTED p Body_is Prot_op_bodies_opt End_id_opt SEMI
 ;
syntax ABORT
        = 
        "abort"
 ;
syntax ABS
        = 
        "abs"
 ;
syntax ABSTRACT
        = 
        "abstract"
 ;
syntax ACCEPT
        = 
        "accept"
 ;
syntax ACCESS
        = 
        "access"
 ;
syntax ALIASED
        = 
        "aliased"
 ;
syntax ALL
        = 
        "all"
 ;
syntax AND
        = 
        "and"
 ;
syntax ARRAY
        = 
        "array"
 ;
syntax AT
        = 
        "at"
 ;
syntax BEGIN
        = 
        "begin"
 ;
syntax BODY
        = 
        "body"
 ;
syntax CASE
        = 
        "case"
 ;
syntax CONSTANT
        = 
        "constant"
 ;
syntax DECLARE
        = 
        "declare"
 ;
syntax DELAY
        = 
        "delay"
 ;
syntax DELTA
        = 
        "delta"
 ;
syntax DIGITS
        = 
        "digits"
 ;
syntax DO
        = 
        "do"
 ;
syntax ELSE
        = 
        "else"
 ;
syntax ELSIF
        = 
        "elsif"
 ;
syntax END
        = 
        "end"
 ;
syntax ENTRY
        = 
        "entry"
 ;
syntax EXCEPTION
        = 
        "exception"
 ;
syntax EXIT
        = 
        "exit"
 ;
syntax FOR
        = 
        "for"
 ;
syntax FUNCTION
        = 
        "function"
 ;
syntax GENERIC
        = 
        "generic"
 ;
syntax GOTO
        = 
        "goto"
 ;
syntax IF
        = 
        "if"
 ;
syntax IN
        = 
        "in"
 ;
syntax IS
        = 
        "is"
 ;
syntax LIMITED
        = 
        "limited"
 ;
syntax LOOP
        = 
        "loop"
 ;
syntax MOD
        = 
        "mod"
 ;
syntax NEW
        = 
        "new"
 ;
syntax NOT
        = 
        "not"
 ;
syntax NuLL
        = 
        "null"
 ;
syntax OF
        = 
        "of"
 ;
syntax OR
        = 
        "or"
 ;
syntax OTHERS
        = 
        "others"
 ;
syntax OUT
        = 
        "out"
 ;
syntax PACKAGE
        = 
        "package"
 ;
syntax PRAGMA
        = 
        "pragma"
 ;
syntax PRIVATE
        = 
        "private"
 ;
syntax PROCEDURE
        = 
        "procedure"
 ;
syntax PROTECTED
        = 
        "protected"
 ;
syntax RAISE
        = 
        "raise"
 ;
syntax RANGE
        = 
        "range"
 ;
syntax RECORD
        = 
        "record"
 ;
syntax REM
        = 
        "rem"
 ;
syntax RENAMES
        = 
        "renames"
 ;
syntax REQUEUE
        = 
        "requeue"
 ;
syntax RETURN
        = 
        "return"
 ;
syntax REVERSE
        = 
        "reverse"
 ;
syntax SELECT
        = 
        "select"
 ;
syntax SEPARATE
        = 
        "separate"
 ;
syntax SUBTYPE
        = 
        "subtype"
 ;
syntax TAGGED
        = 
        "tagged"
 ;
syntax TASK
        = 
        "task"
 ;
syntax TERMINATE
        = 
        "terminate"
 ;
syntax THEN
        = 
        "then"
 ;
syntax TYPE
        = 
        "type"
 ;
syntax UNTIL
        = 
        "until"
 ;
syntax USE
        = 
        "use"
 ;
syntax WHEN
        = 
        "when"
 ;
syntax WHILE
        = 
        "while"
 ;
syntax WITH
        = 
        "with"
 ;
syntax XOR
        = 
        "xor"
 ;
syntax COMMENT_INTRO
        = 
        "--"
 ;
syntax DOT_DOT
        = 
        ".."
 ;
syntax LT_LT
        = 
        "\<\<"
 ;
syntax BOX
        = 
        "\<\>"
 ;
syntax GT_GT
        = 
        "\>\>"
 ;
syntax ASSIGN
        = 
        ":="
 ;
syntax RIGHT_SHAFT
        = 
        "=\>"
 ;
syntax NE
        = 
        "/="
 ;
syntax LE
        = 
        "\<="
 ;
syntax GE
        = 
        "\>="
 ;
syntax EXPON
        = 
        "**"
 ;
syntax PIPE
        = 
        "|"
 ;
syntax CONCAT
        = 
        "&"
 ;
syntax DOT
        = 
        "."
 ;
syntax EQ
        = 
        "="
 ;
syntax LT_
        = 
        "\<"
 ;
syntax GT
        = 
        "\>"
 ;
syntax PLUS
        = 
        "+"
 ;
syntax MINUS
        = 
        "-"
 ;
syntax STAR
        = 
        "*"
 ;
syntax DIV
        = 
        "/"
 ;
syntax LPAREN
        = 
        "("
 ;
syntax RPAREN
        = 
        ")"
 ;
syntax COLON
        = 
        ":"
 ;
syntax COMMA
        = 
        ","
 ;
syntax SEMI
        = 
        ";"
 ;
syntax TIC
        = 
        "'"
 ;
syntax IDENTIFIER
        = 
        ("a" | "b" | "c" | "d" | "e" | "f" | "g" | "h" | "i" | "j" | "k" | "l" | "m" | "n" | "o" | "p" | "q" | "r" | "s" | "t" | "u" | "v" | "w" | "x" | "y" | "z") ("_"? ("a" | "b" | "c" | "d" | "e" | "f" | "g" | "h" | "i" | "j" | "k" | "l" | "m" | "n" | "o" | "p" | "q" | "r" | "s" | "t" | "u" | "v" | "w" | "x" | "y" | "z" | "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9"))*
 ;
syntax CHARACTER_LITERAL
        = 
        "'" ANY "'"
 ;
syntax CHAR_STRING
        = 
        "\"" ANY* "\""
 ;
syntax NUMERIC_LIT
        = 
        DIGIT+ (("#" BASED_INTEGER ("." BASED_INTEGER)? "#") | ("_" DIGIT+)+)? (("." DIGIT+ ("_" DIGIT+)* EXPONENT?) | EXPONENT)?
 ;
syntax DIGIT
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
syntax EXPONENT
        = 
        "e" ("+" | "-")? DIGIT+
 ;
syntax EXTENDED_DIGIT
        = DIGIT
        | "a"
        | "b"
        | "c"
        | "d"
        | "e"
        | "f"
 ;
syntax BASED_INTEGER
        = 
        EXTENDED_DIGIT ("_"? EXTENDED_DIGIT)*
 ;
syntax WS_
        = " "
        | "\\t"
        | "\\f"
        | "\\r\\n"
        | "\\r"
        | "\\n"
 ;
syntax COMMENT
        = 
        COMMENT_INTRO ANY* ("\\n" | ("\\r" "\\n"?))
 ;
