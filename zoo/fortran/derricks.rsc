@contributor{bgf2src automated exporter - SLPS}
module Derricks

syntax ExecutableProgram
        = 
        StartCommentBlock? ProgramUnit+
 ;
syntax ProgramUnit
        = MainProgram
        | FunctionSubprogram
        | SubroutineSubprogram
        | Module
        | BlockDataSubprogram
 ;
syntax MainProgram
        = 
        ProgramStmt? MainRange
 ;
syntax ProgramStmt
        = 
        LblDef "program" ProgramName EOS
 ;
syntax LblDef
        = 
        Label?
 ;
syntax ProgramName
        = 
        Ident
 ;
syntax MainRange
        = BodyConstruct+ EndProgramStmt
        | InternalSubProgPart EndProgramStmt
        | EndProgramStmt
 ;
syntax BodyConstruct
        = SpecificationPartConstruct
        | ExecutableConstruct
 ;
syntax SpecificationPartConstruct
        = ImplicitStmt
        | ParameterStmt
        | FormatStmt
        | EntryStmt
        | DeclarationConstruct
        | UseStmt
 ;
syntax ImplicitStmt
        = LblDef "implicit" "none" EOS
        | LblDef "implicit" ImplicitSpec ("," ImplicitSpec)* EOS
 ;
syntax ImplicitSpec
        = 
        TypeSpec "(" LetterSpec ("," LetterSpec)* ")"
 ;
syntax TypeSpec
        = "integer" KindSelector
        | "real" KindSelector
        | "double" "precision"
        | "complex" KindSelector
        | "character" CharSelector
        | "logical" KindSelector
        | "type" "(" TypeName ")"
        | "integer"
        | "real"
        | "complex"
        | "logical"
        | "character"
        | "character" LengthSelector
 ;
syntax KindSelector
        = "(" ("kind" "=")? Expr ")"
        | "*" Icon
 ;
syntax Expr
        = 
        (Expr DefinedBinaryOp)? Level5Expr
 ;
syntax DefinedBinaryOp
        = 
        Dop
 ;
syntax Level5Expr
        = 
        (Level5Expr EquivOp)? EquivOperand
 ;
syntax EquivOp
        = ".eqv."
        | ".neqv."
 ;
syntax EquivOperand
        = 
        (EquivOperand OrOp)? OrOperand
 ;
syntax OrOp
        = 
        ".or."
 ;
syntax OrOperand
        = 
        (OrOperand AndOp)? AndOperand
 ;
syntax AndOp
        = 
        ".and."
 ;
syntax AndOperand
        = 
        NotOp? Level4Expr
 ;
syntax NotOp
        = 
        ".not."
 ;
syntax Level4Expr
        = 
        (Level3Expr RelOp)? Level3Expr
 ;
syntax Level3Expr
        = 
        (Level3Expr ConcatOp)? Level2Expr
 ;
syntax ConcatOp
        = 
        "//"
 ;
syntax Level2Expr
        = (Level2Expr AddOp)? AddOperand
        | Sign AddOperand
 ;
syntax AddOp
        = "+"
        | "-"
 ;
syntax AddOperand
        = 
        (AddOperand MultOp)? MultOperand
 ;
syntax MultOp
        = "*"
        | "/"
 ;
syntax MultOperand
        = 
        Level1Expr (PowerOp MultOperand)?
 ;
syntax Level1Expr
        = 
        DefinedUnaryOp? Primary
 ;
syntax DefinedUnaryOp
        = 
        Dop
 ;
syntax Primary
        = ArrayConstructor
        | UnsignedArithmeticConstant
        | Name
        | DataRef
        | FunctionReference
        | "(" Expr ")"
        | Scon
        | LogicalConstant
 ;
syntax ArrayConstructor
        = 
        "(/" AcValueList "/)"
 ;
syntax AcValueList
        = 
        AcValue ("," AcValue)*
 ;
syntax AcValue
        = Expr
        | AcImpliedDo
 ;
syntax AcImpliedDo
        = "(" Expr "," ImpliedDoVariable "=" Expr "," Expr ")"
        | "(" Expr "," ImpliedDoVariable "=" Expr "," Expr "," Expr ")"
        | "(" AcImpliedDo "," ImpliedDoVariable "=" Expr "," Expr ")"
        | "(" AcImpliedDo "," ImpliedDoVariable "=" Expr "," Expr "," Expr ")"
 ;
syntax ImpliedDoVariable
        = 
        Ident
 ;
syntax UnsignedArithmeticConstant
        = Icon "_" KindParam
        | Rcon "_" KindParam
        | Icon
        | Rcon
        | ComplexConst
 ;
syntax KindParam
        = Icon
        | NamedConstantUse
 ;
syntax NamedConstantUse
        = 
        Ident
 ;
syntax ComplexConst
        = 
        "(" Expr "," Expr ")"
 ;
syntax Name
        = 
        Ident
 ;
syntax DataRef
        = Name "%" Name
        | DataRef "%" Name
        | Name "(" SectionSubscriptList ")"
        | DataRef "(" SectionSubscriptList ")"
 ;
syntax SectionSubscriptList
        = 
        SectionSubscript ("," SectionSubscript)*
 ;
syntax SectionSubscript
        = Expr
        | SubscriptTriplet
 ;
syntax SubscriptTriplet
        = 
        Expr? ":" Expr? (":" Expr)?
 ;
syntax FunctionReference
        = 
        Name "(" FunctionArgList? ")"
 ;
syntax FunctionArgList
        = FunctionArg
        | FunctionArgList "," FunctionArg
        | SectionSubscriptList "," FunctionArg
 ;
syntax FunctionArg
        = 
        Name "=" Expr
 ;
syntax LogicalConstant
        = ".true." "_" KindParam
        | ".false." "_" KindParam
        | ".true."
        | ".false."
 ;
syntax PowerOp
        = 
        "**"
 ;
syntax Sign
        = "+"
        | "-"
 ;
syntax RelOp
        = "=="
        | "/="
        | "\<"
        | "\<="
        | "\>"
        | "\>="
        | ".eq."
        | ".ne."
        | ".lt."
        | ".le."
        | ".gt."
        | ".ge."
 ;
syntax CharSelector
        = "(" "len" "=" TypeParamValue "," "kind" "=" Expr ")"
        | "(" "len" "=" TypeParamValue "," Expr ")"
        | "(" "len" "=" TypeParamValue ")"
        | "(" ("kind" "=")? Expr ")"
 ;
syntax TypeParamValue
        = SpecificationExpr
        | "*"
 ;
syntax SpecificationExpr
        = 
        Expr
 ;
syntax TypeName
        = 
        Ident
 ;
syntax LengthSelector
        = "(" TypeParamValue ")"
        | "*" CharLength
 ;
syntax CharLength
        = "(" TypeParamValue ")"
        | ScalarIntLiteralConstant
 ;
syntax LetterSpec
        = 
        Letter ("-" Letter)?
 ;
syntax ParameterStmt
        = 
        LblDef "parameter" "(" NamedConstantDefList ")" EOS
 ;
syntax NamedConstantDefList
        = 
        NamedConstantDef ("," NamedConstantDef)*
 ;
syntax NamedConstantDef
        = 
        NamedConstant "=" Expr
 ;
syntax NamedConstant
        = 
        Ident
 ;
syntax FormatStmt
        = 
        LblDef "format" "(" FormatItemList? ")" EOS
 ;
syntax FormatItemList
        = 
        FormatItem ("," FormatItem)*
 ;
syntax FormatItem
        = Icon? DataEditDescr
        | ControlEditDescr
        | CharStringEditDescr
        | Icon? "(" FormatItemList ")"
        | FormatItem ":" FormatItem
 ;
syntax DataEditDescr
        = "I" Icon ("." Icon)?
        | "O" Icon ("." Icon)?
        | "B" Icon ("." Icon)?
        | "Z" Icon ("." Icon)?
        | "F" Icon "." Icon
        | "E" Icon "." Icon ("E" Icon)?
        | "EN" Icon "." Icon ("E" Icon)?
        | "ES" Icon "." Icon ("E" Icon)?
        | "G" Icon "." Icon ("E" Icon)?
        | "L" Icon
        | "A" Icon?
        | "D" Icon "." Icon
 ;
syntax ControlEditDescr
        = PositionEditDescr
        | Icon? "/"
        | ":"
        | SignEditDescr
        | ("-" | "+")? Icon "P" (Icon? DataEditDescr)?
        | BlankInterpEditDescr
 ;
syntax PositionEditDescr
        = "T" Icon
        | "TL" Icon
        | "TR" Icon
        | Icon "X"
 ;
syntax SignEditDescr
        = "S"
        | "SP"
        | "SS"
 ;
syntax BlankInterpEditDescr
        = "BN"
        | "BZ"
 ;
syntax CharStringEditDescr
        = Scon
        | Icon "H" Character+
 ;
syntax EntryStmt
        = LblDef "entry" EntryName SubroutineParList EOS
        | LblDef "entry" EntryName SubroutineParList "result" "(" Name ")" EOS
 ;
syntax EntryName
        = 
        Ident
 ;
syntax SubroutineParList
        = 
        "(" {SubroutinePar ","}* ")"
 ;
syntax SubroutinePar
        = DummyArgName
        | "*"
 ;
syntax DummyArgName
        = 
        Ident
 ;
syntax DeclarationConstruct
        = TypeDeclarationStmt
        | SpecificationStmt
        | DerivedTypeDef
        | InterfaceBlock
 ;
syntax TypeDeclarationStmt
        = LblDef TypeSpec ("," AttrSpec)* ":" ":" EntityDecl ("," EntityDecl)* EOS
        | LblDef TypeSpec EntityDecl ("," EntityDecl)* EOS
 ;
syntax AttrSpec
        = "parameter"
        | AccessSpec
        | "allocatable"
        | "dimension" "(" ArraySpec ")"
        | "external"
        | "intent" "(" IntentSpec ")"
        | "intrinsic"
        | "optional"
        | "pointer"
        | "save"
        | "target"
 ;
syntax AccessSpec
        = "public"
        | "private"
 ;
syntax ArraySpec
        = AssumedShapeSpecList
        | DeferredShapeSpecList
        | ExplicitShapeSpecList
        | AssumedSizeSpec
 ;
syntax AssumedShapeSpecList
        = LowerBound ":"
        | DeferredShapeSpecList "," LowerBound ":"
        | AssumedShapeSpecList "," AssumedShapeSpec
 ;
syntax LowerBound
        = 
        SpecificationExpr
 ;
syntax DeferredShapeSpecList
        = 
        DeferredShapeSpec ("," DeferredShapeSpec)*
 ;
syntax DeferredShapeSpec
        = 
        ":"
 ;
syntax AssumedShapeSpec
        = 
        LowerBound? ":"
 ;
syntax ExplicitShapeSpecList
        = 
        ExplicitShapeSpec ("," ExplicitShapeSpec)*
 ;
syntax ExplicitShapeSpec
        = 
        (LowerBound ":")? UpperBound
 ;
syntax UpperBound
        = 
        SpecificationExpr
 ;
syntax AssumedSizeSpec
        = (LowerBound ":")? "*"
        | ExplicitShapeSpecList "," "*"
        | ExplicitShapeSpecList "," LowerBound ":" "*"
 ;
syntax IntentSpec
        = "in"
        | "out"
        | "in" "out"
 ;
syntax EntityDecl
        = ObjectName "=" Expr
        | ObjectName "(" ArraySpec ")" "=" Expr
        | ObjectName "*" CharLength "=" Expr
        | ObjectName "*" CharLength "(" ArraySpec ")" "=" Expr
        | ObjectName
        | ObjectName "*" CharLength
        | ObjectName "(" ArraySpec ")"
        | ObjectName "(" ArraySpec ")" "*" CharLength
 ;
syntax ObjectName
        = 
        Ident
 ;
syntax SpecificationStmt
        = AccessStmt
        | AllocatableStmt
        | CommonStmt
        | DataStmt
        | DimensionStmt
        | EquivalenceStmt
        | ExternalStmt
        | IntrinsicStmt
        | SaveStmt
        | IntentStmt
        | NamelistStmt
        | OptionalStmt
        | PointerStmt
        | TargetStmt
 ;
syntax AccessStmt
        = LblDef AccessSpec ":" ":" AccessIdList EOS
        | LblDef AccessSpec AccessIdList? EOS
 ;
syntax AccessIdList
        = 
        AccessId ("," AccessId)*
 ;
syntax AccessId
        = GenericName
        | GenericSpec
 ;
syntax GenericName
        = 
        Ident
 ;
syntax GenericSpec
        = "operator" "(" DefinedOperator ")"
        | "assignment" "(" "=" ")"
 ;
syntax DefinedOperator
        = Dop
        | PowerOp
        | MultOp
        | AddOp
        | ConcatOp
        | RelOp
        | NotOp
        | AndOp
        | OrOp
        | EquivOp
 ;
syntax AllocatableStmt
        = LblDef "allocatable" ":" ":" ArrayAllocationList EOS
        | LblDef "allocatable" ArrayAllocationList EOS
 ;
syntax ArrayAllocationList
        = 
        ArrayAllocation ("," ArrayAllocation)*
 ;
syntax ArrayAllocation
        = 
        ArrayName ("(" DeferredShapeSpecList ")")?
 ;
syntax ArrayName
        = 
        Ident
 ;
syntax CommonStmt
        = 
        LblDef "common" Comblock? CommonBlockObjectList (","? Comblock CommonBlockObjectList)* EOS
 ;
syntax Comblock
        = 
        "/" CommonBlockName? "/"
 ;
syntax CommonBlockName
        = 
        Ident
 ;
syntax CommonBlockObjectList
        = 
        CommonBlockObject ("," CommonBlockObject)*
 ;
syntax CommonBlockObject
        = VariableName
        | ArrayDeclarator
 ;
syntax VariableName
        = 
        Ident
 ;
syntax ArrayDeclarator
        = 
        VariableName "(" ArraySpec ")"
 ;
syntax DataStmt
        = 
        LblDef "data" Datalist EOS
 ;
syntax Datalist
        = 
        DataStmtSet ("," DataStmtSet)*
 ;
syntax DataStmtSet
        = 
        DataStmtObjectList "/" DataStmtValueList "/"
 ;
syntax DataStmtObjectList
        = 
        DataStmtObject ("," DataStmtObject)*
 ;
syntax DataStmtObject
        = Variable
        | DataImpliedDo
 ;
syntax Variable
        = VariableName
        | VariableName "(" Subscript ("," Subscript)* ")"
        | VariableName SubstringRange
        | VariableName "(" Subscript ("," Subscript)* ")" SubstringRange
 ;
syntax Subscript
        = 
        Expr
 ;
syntax SubstringRange
        = 
        "(" SubscriptTriplet ")"
 ;
syntax DataImpliedDo
        = 
        "(" DataIDoObjectList "," ImpliedDoVariable "=" Expr "," Expr ("," Expr)? ")"
 ;
syntax DataIDoObjectList
        = 
        DataIDoObject ("," DataIDoObject)*
 ;
syntax DataIDoObject
        = ArrayElement
        | DataImpliedDo
        | StructureComponent
 ;
syntax ArrayElement
        = StructureComponent "(" SectionSubscriptList ")"
        | VariableName "(" SectionSubscriptList ")"
 ;
syntax StructureComponent
        = VariableName FieldSelector
        | StructureComponent FieldSelector
 ;
syntax FieldSelector
        = "(" SectionSubscriptList ")" "%" Name
        | "%" Name
 ;
syntax DataStmtValueList
        = 
        DataStmtValue ("," DataStmtValue)*
 ;
syntax DataStmtValue
        = Constant
        | NamedConstantUse "*" Constant
 ;
syntax Constant
        = NamedConstantUse
        | UnsignedArithmeticConstant
        | "+" UnsignedArithmeticConstant
        | "-" UnsignedArithmeticConstant
        | Scon
        | LogicalConstant
        | Icon "_" Scon
        | NamedConstantUse "_" Scon
        | StructureConstructor
        | BozLiteralConstant
 ;
syntax StructureConstructor
        = 
        TypeName "(" Expr ("," Expr)* ")"
 ;
syntax BozLiteralConstant
        = BinaryConstant
        | OctalConstant
        | HexConstant
 ;
syntax DimensionStmt
        = LblDef "dimension" ":" ":" ArrayDeclaratorList EOS
        | LblDef "dimension" ArrayDeclaratorList EOS
 ;
syntax ArrayDeclaratorList
        = 
        ArrayDeclarator ("," ArrayDeclarator)*
 ;
syntax EquivalenceStmt
        = 
        LblDef "equivalence" EquivalenceSetList EOS
 ;
syntax EquivalenceSetList
        = 
        EquivalenceSet ("," EquivalenceSet)*
 ;
syntax EquivalenceSet
        = 
        "(" EquivalenceObject "," EquivalenceObject ("," EquivalenceObject)* ")"
 ;
syntax EquivalenceObject
        = ArrayName
        | Variable
 ;
syntax ExternalStmt
        = 
        LblDef "external" ExternalName ("," ExternalName)* EOS
 ;
syntax ExternalName
        = 
        Ident
 ;
syntax IntrinsicStmt
        = 
        LblDef "intrinsic" IntrinsicProcedureName ("," IntrinsicProcedureName)* EOS
 ;
syntax IntrinsicProcedureName
        = 
        Ident
 ;
syntax SaveStmt
        = LblDef "save" ":" ":" SavedEntityList EOS
        | LblDef "save" SavedEntityList? EOS
 ;
syntax SavedEntityList
        = 
        SavedEntity ("," SavedEntity)*
 ;
syntax SavedEntity
        = VariableName
        | "/" CommonBlockName "/"
 ;
syntax IntentStmt
        = LblDef "intent" "(" IntentSpec ")" ":" ":" IntentParList EOS
        | LblDef "intent" "(" IntentSpec ")" IntentParList EOS
 ;
syntax IntentParList
        = 
        IntentPar ("," IntentPar)*
 ;
syntax IntentPar
        = 
        DummyArgName
 ;
syntax NamelistStmt
        = 
        LblDef "namelist" NamelistGroup (","? NamelistGroup)* EOS
 ;
syntax NamelistGroup
        = 
        "/" NamelistGroupName "/" NamelistGroupObject ("," NamelistGroupObject)*
 ;
syntax NamelistGroupName
        = 
        Ident
 ;
syntax NamelistGroupObject
        = 
        VariableName
 ;
syntax OptionalStmt
        = LblDef "optional" ":" ":" OptionalParList EOS
        | LblDef "optional" OptionalParList EOS
 ;
syntax OptionalParList
        = 
        OptionalPar ("," OptionalPar)*
 ;
syntax OptionalPar
        = 
        DummyArgName
 ;
syntax PointerStmt
        = LblDef "pointer" ":" ":" PointerStmtObjectList EOS
        | LblDef "pointer" PointerStmtObjectList EOS
 ;
syntax PointerStmtObjectList
        = 
        PointerStmtObject ("," PointerStmtObject)*
 ;
syntax PointerStmtObject
        = ObjectName
        | ObjectName "(" DeferredShapeSpecList ")"
 ;
syntax TargetStmt
        = LblDef "target" ":" ":" TargetObjectList EOS
        | LblDef "target" TargetObjectList EOS
 ;
syntax TargetObjectList
        = 
        TargetObject ("," TargetObject)*
 ;
syntax TargetObject
        = ObjectName
        | ObjectName "(" ArraySpec ")"
 ;
syntax DerivedTypeDef
        = 
        DerivedTypeStmt DerivedTypeBody+ EndTypeStmt
 ;
syntax DerivedTypeStmt
        = LblDef "type" TypeName EOS
        | LblDef "type" ":" ":" TypeName EOS
        | LblDef "type" "," AccessSpec ":" ":" TypeName EOS
 ;
syntax DerivedTypeBody
        = PrivateSequenceStmt
        | ComponentDefStmt
 ;
syntax PrivateSequenceStmt
        = LblDef "private" EOS
        | LblDef "sequence" EOS
 ;
syntax ComponentDefStmt
        = LblDef TypeSpec ("," ComponentAttrSpecList)? ":" ":" ComponentDeclList EOS
        | LblDef TypeSpec ComponentDeclList EOS
 ;
syntax ComponentAttrSpecList
        = 
        ComponentAttrSpec ("," ComponentAttrSpec)*
 ;
syntax ComponentAttrSpec
        = "pointer"
        | "dimension" "(" ComponentArraySpec ")"
 ;
syntax ComponentArraySpec
        = ExplicitShapeSpecList
        | DeferredShapeSpecList
 ;
syntax ComponentDeclList
        = 
        ComponentDecl ("," ComponentDecl)*
 ;
syntax ComponentDecl
        = 
        ComponentName ("(" ComponentArraySpec ")")? ("*" CharLength)?
 ;
syntax ComponentName
        = 
        Ident
 ;
syntax EndTypeStmt
        = 
        LblDef "end" "type" TypeName? EOS
 ;
syntax InterfaceBlock
        = 
        InterfaceStmt InterfaceBlockPart+ EndInterfaceStmt
 ;
syntax InterfaceStmt
        = LblDef "interface" GenericName EOS
        | LblDef "interface" GenericSpec EOS
        | LblDef "interface" EOS
 ;
syntax InterfaceBlockPart
        = InterfaceBody
        | ModuleProcedureStmt
 ;
syntax InterfaceBody
        = LblDef FunctionPrefix FunctionName FunctionInterfaceRange
        | LblDef "subroutine" SubroutineName SubroutineInterfaceRange
 ;
syntax FunctionPrefix
        = "recursive" "function"
        | "recursive" TypeSpec "function"
        | TypeSpec "recursive" "function"
        | TypeSpec? "function"
 ;
syntax FunctionName
        = 
        Ident
 ;
syntax FunctionInterfaceRange
        = FunctionParList EOS SubprogramInterfaceBody EndFunctionStmt
        | FunctionParList EOS EndFunctionStmt
 ;
syntax FunctionParList
        = 
        "(" {FunctionPar ","}* ")"
 ;
syntax FunctionPar
        = 
        DummyArgName
 ;
syntax SubprogramInterfaceBody
        = SpecificationPartConstruct
        | SubprogramInterfaceBody SpecificationPartConstruct
 ;
syntax EndFunctionStmt
        = LblDef "end" EOS
        | LblDef "end" "function" EndName? EOS
 ;
syntax EndName
        = 
        Ident
 ;
syntax SubroutineName
        = 
        Ident
 ;
syntax SubroutineInterfaceRange
        = SubroutineParList EOS SubprogramInterfaceBody EndSubroutineStmt
        | SubroutineParList EOS EndSubroutineStmt
 ;
syntax EndSubroutineStmt
        = LblDef "end" "subroutine" EndName? EOS
        | LblDef "end" EOS
 ;
syntax ModuleProcedureStmt
        = 
        LblDef "module" "procedure" ProcedureNameList EOS
 ;
syntax ProcedureNameList
        = 
        ProcedureName ("," ProcedureName)*
 ;
syntax ProcedureName
        = 
        Ident
 ;
syntax EndInterfaceStmt
        = 
        LblDef "end" "interface" EOS
 ;
syntax UseStmt
        = LblDef "use" Name ("," RenameList)? EOS
        | LblDef "use" Name "," "only" ":" OnlyList? EOS
 ;
syntax RenameList
        = 
        Rename ("," Rename)*
 ;
syntax Rename
        = 
        Ident "=\>" UseName
 ;
syntax UseName
        = 
        Ident
 ;
syntax OnlyList
        = 
        Only ("," Only)*
 ;
syntax Only
        = GenericSpec
        | (Ident "=\>")? UseName
 ;
syntax ExecutableConstruct
        = ActionStmt
        | DoConstruct
        | IfConstruct
        | CaseConstruct
        | WhereConstruct
        | EndDoStmt
 ;
syntax ActionStmt
        = AllocateStmt
        | CycleStmt
        | DeallocateStmt
        | ExitStmt
        | NullifyStmt
        | PointerAssignmentStmt
        | WhereStmt
        | ArithmeticIfStmt
        | AssignmentStmt
        | AssignStmt
        | BackspaceStmt
        | CallStmt
        | CloseStmt
        | ContinueStmt
        | EndfileStmt
        | GotoStmt
        | ComputedGotoStmt
        | AssignedGotoStmt
        | IfStmt
        | InquireStmt
        | OpenStmt
        | PauseStmt
        | PrintStmt
        | ReadStmt
        | ReturnStmt
        | RewindStmt
        | StopStmt
        | WriteStmt
 ;
syntax AllocateStmt
        = LblDef "allocate" "(" AllocationList "," "stat" "=" Variable ")" EOS
        | LblDef "allocate" "(" AllocationList ")" EOS
 ;
syntax AllocationList
        = 
        Allocation ("," Allocation)*
 ;
syntax Allocation
        = 
        AllocateObject AllocatedShape?
 ;
syntax AllocateObject
        = VariableName
        | AllocateObject FieldSelector
 ;
syntax AllocatedShape
        = 
        "(" SectionSubscriptList ")"
 ;
syntax CycleStmt
        = 
        LblDef "cycle" EndName? EOS
 ;
syntax DeallocateStmt
        = LblDef "deallocate" "(" AllocateObjectList "," "stat" "=" Variable ")" EOS
        | LblDef "deallocate" "(" AllocateObjectList ")" EOS
 ;
syntax AllocateObjectList
        = 
        AllocateObject ("," AllocateObject)*
 ;
syntax ExitStmt
        = 
        LblDef "exit" EndName? EOS
 ;
syntax NullifyStmt
        = 
        LblDef "nullify" "(" PointerObjectList ")" EOS
 ;
syntax PointerObjectList
        = 
        PointerObject ("," PointerObject)*
 ;
syntax PointerObject
        = Name
        | PointerField
 ;
syntax PointerField
        = Name "(" SFExprList ")" "%" Name
        | Name "(" SFDummyArgNameList ")" "%" Name
        | Name "%" Name
        | PointerField FieldSelector
 ;
syntax SFExprList
        = SFExpr ":" Expr ":" Expr
        | SFExpr ":" ":" Expr
        | ":" Expr ":" Expr
        | ":" ":" Expr
        | ":"
        | ":" Expr
        | SFExpr
        | SFExpr ":"
        | SFExpr ":" Expr
        | SFExprList "," SectionSubscript
        | SFDummyArgNameList "," ":"
        | SFDummyArgNameList "," ":" Expr
        | SFDummyArgNameList "," SFExpr ":"
        | SFDummyArgNameList "," SFExpr ":" Expr
 ;
syntax SFExpr
        = SFTerm
        | Sign AddOperand
        | SFExpr AddOp AddOperand
 ;
syntax SFTerm
        = SFFactor
        | SFTerm MultOp MultOperand
 ;
syntax SFFactor
        = SFPrimary
        | SFPrimary PowerOp MultOperand
 ;
syntax SFPrimary
        = ArrayConstructor
        | Icon
        | Name
        | DataRef
        | FunctionReference
        | "(" Expr ")"
 ;
syntax SFDummyArgNameList
        = 
        SFDummyArgName ("," SFDummyArgName)*
 ;
syntax SFDummyArgName
        = 
        Ident
 ;
syntax PointerAssignmentStmt
        = LblDef Name "=\>" Target EOS
        | LblDef Name "%" Name "=\>" Target EOS
        | LblDef Name "%" DataRef "=\>" Target EOS
        | LblDef Name "(" SFExprList ")" "%" Name "=\>" Target EOS
        | LblDef Name "(" SFExprList ")" "%" DataRef "=\>" Target EOS
        | LblDef Name "(" SFDummyArgNameList ")" "%" Name "=\>" Target EOS
        | LblDef Name "(" SFDummyArgNameList ")" "%" DataRef "=\>" Target EOS
 ;
syntax Target
        = 
        Expr
 ;
syntax WhereStmt
        = 
        LblDef "where" "(" MaskExpr ")" AssignmentStmt
 ;
syntax MaskExpr
        = 
        Expr
 ;
syntax AssignmentStmt
        = LblDef Name "%" Name "=" Expr EOS
        | LblDef Name "%" DataRef "=" Expr EOS
        | LblDef Name "(" SFExprList ")" "%" Name "=" Expr EOS
        | LblDef Name "(" SFExprList ")" "%" DataRef "=" Expr EOS
        | LblDef Name "(" SFDummyArgNameList ")" "%" Name "=" Expr EOS
        | LblDef Name "(" SFDummyArgNameList ")" "%" DataRef "=" Expr EOS
        | LblDef Name "=" Expr EOS
        | LblDef Name "(" SFExprList ")" "=" Expr EOS
        | LblDef Name "(" SFExprList ")" SubstringRange "=" Expr EOS
 ;
syntax ArithmeticIfStmt
        = 
        LblDef "if" "(" ScalarNumericExpr ")" LblRef "," LblRef "," LblRef EOS
 ;
syntax ScalarNumericExpr
        = 
        Expr
 ;
syntax LblRef
        = 
        Icon
 ;
syntax AssignStmt
        = 
        LblDef "assign" LblRef "to" VariableName EOS
 ;
syntax BackspaceStmt
        = LblDef "backspace" UnitIdentifier EOS
        | LblDef "backspace" "(" PositionSpec ("," PositionSpec)* ")" EOS
 ;
syntax UnitIdentifier
        = UFExpr
        | "*"
 ;
syntax UFExpr
        = UFTerm
        | Sign UFTerm
        | UFExpr AddOp UFTerm
 ;
syntax UFTerm
        = UFFactor
        | UFTerm MultOp UFFactor
        | UFTerm ConcatOp UFPrimary
 ;
syntax UFFactor
        = UFPrimary
        | UFPrimary PowerOp UFFactor
 ;
syntax UFPrimary
        = Icon
        | Scon
        | Name
        | FunctionReference
        | DataRef
        | "(" UFExpr ")"
 ;
syntax PositionSpec
        = "unit="? UnitIdentifier
        | "iostat=" ScalarVariable
        | "err=" LblRef
 ;
syntax ScalarVariable
        = VariableName
        | ArrayElement
 ;
syntax CallStmt
        = LblDef "call" SubroutineNameUse EOS
        | LblDef "call" SubroutineNameUse "(" {ActualArg ","}* ")" EOS
 ;
syntax SubroutineNameUse
        = 
        Ident
 ;
syntax ActualArg
        = (Name "=")? Expr
        | (Name "=")? "*" LblRef
 ;
syntax CloseStmt
        = 
        LblDef "close" "(" CloseSpecList ")" EOS
 ;
syntax CloseSpecList
        = 
        CloseSpec ("," CloseSpec)*
 ;
syntax CloseSpec
        = UnitIdentifier
        | "unit" "=" UnitIdentifier
        | "iostat" "=" ScalarVariable
        | "err" "=" LblRef
        | "status" "=" CExpr
 ;
syntax CExpr
        = 
        (CExpr ConcatOp)? CPrimary
 ;
syntax CPrimary
        = COperand
        | "(" CExpr ")"
 ;
syntax COperand
        = Scon
        | Name
        | DataRef
        | FunctionReference
 ;
syntax ContinueStmt
        = 
        LblDef "continue" EOS
 ;
syntax EndfileStmt
        = LblDef "end" "file" UnitIdentifier EOS
        | LblDef "end" "file" "(" PositionSpec ("," PositionSpec)* ")" EOS
 ;
syntax GotoStmt
        = 
        LblDef GoToKw LblRef EOS
 ;
syntax GoToKw
        = 
        "go" "to"
 ;
syntax ComputedGotoStmt
        = 
        LblDef GoToKw "(" LblRef ("," LblRef)* ")" ","? ScalarIntExpr EOS
 ;
syntax ScalarIntExpr
        = 
        Expr
 ;
syntax AssignedGotoStmt
        = LblDef GoToKw VariableName EOS
        | LblDef GoToKw VariableName ","? "(" LblRef ("," LblRef)* ")" EOS
 ;
syntax IfStmt
        = 
        LblDef "if" "(" ScalarLogicalExpr ")" ActionStmt
 ;
syntax ScalarLogicalExpr
        = 
        Expr
 ;
syntax InquireStmt
        = LblDef "inquire" "(" InquireSpecList ")" EOS
        | LblDef "inquire" "(" "iolength" "=" ScalarVariable ")" OutputItemList EOS
 ;
syntax InquireSpecList
        = UnitIdentifier "," InquireSpec ("," InquireSpec)*
        | InquireSpec ("," InquireSpec)*
 ;
syntax InquireSpec
        = "unit" "=" UnitIdentifier
        | "file" "=" CExpr
        | "iostat" "=" ScalarVariable
        | "err" "=" LblRef
        | "exist" "=" ScalarVariable
        | "opened" "=" ScalarVariable
        | "number" "=" ScalarVariable
        | "named" "=" ScalarVariable
        | "name" "=" ScalarVariable
        | "access" "=" ScalarVariable
        | "sequential" "=" ScalarVariable
        | "direct" "=" ScalarVariable
        | "form" "=" ScalarVariable
        | "formatted" "=" ScalarVariable
        | "unformatted" "=" ScalarVariable
        | "recl" "=" Expr
        | "nextrec" "=" ScalarVariable
        | "blank" "=" ScalarVariable
        | "position" "=" ScalarVariable
        | "action" "=" ScalarVariable
        | "read" "=" ScalarVariable
        | "write" "=" ScalarVariable
        | "readwrite" "=" ScalarVariable
        | "delim" "=" ScalarVariable
        | "pad" "=" ScalarVariable
 ;
syntax OutputItemList
        = 
        OutputItem ("," OutputItem)*
 ;
syntax OutputItem
        = Expr
        | OutputImpliedDo
 ;
syntax OutputImpliedDo
        = "(" OutputItemList "," ImpliedDoVariable "=" Expr "," Expr ")"
        | "(" OutputItemList "," ImpliedDoVariable "=" Expr "," Expr "," Expr ")"
 ;
syntax OpenStmt
        = 
        LblDef "open" "(" ConnectSpecList ")" EOS
 ;
syntax ConnectSpecList
        = 
        ConnectSpec ("," ConnectSpec)*
 ;
syntax ConnectSpec
        = UnitIdentifier
        | "unit" "=" UnitIdentifier
        | "iostat" "=" ScalarVariable
        | "err" "=" LblRef
        | "file" "=" CExpr
        | "status" "=" CExpr
        | "access" "=" CExpr
        | "form" "=" CExpr
        | "recl" "=" Expr
        | "blank" "=" CExpr
        | "position" "=" CExpr
        | "action" "=" CExpr
        | "delim" "=" CExpr
        | "pad" "=" CExpr
 ;
syntax PauseStmt
        = 
        LblDef "pause" (Icon | Scon)? EOS
 ;
syntax PrintStmt
        = 
        LblDef "print" FormatIdentifier ("," OutputItemList)? EOS
 ;
syntax FormatIdentifier
        = LblRef
        | CExpr
        | "*"
 ;
syntax ReadStmt
        = LblDef "read" RdCtlSpec InputItemList? EOS
        | LblDef "read" RdFmtId EOS
        | LblDef "read" RdFmtId "," InputItemList EOS
 ;
syntax RdCtlSpec
        = RdUnitId
        | "(" RdIoCtlSpecList ")"
 ;
syntax RdUnitId
        = "(" UFExpr ")"
        | "(" "*" ")"
 ;
syntax RdIoCtlSpecList
        = UnitIdentifier "," IoControlSpec
        | UnitIdentifier "," FormatIdentifier
        | IoControlSpec
        | RdIoCtlSpecList "," IoControlSpec
 ;
syntax IoControlSpec
        = "unit" "=" UnitIdentifier
        | "fmt" "=" FormatIdentifier
        | "nml" "=" NamelistGroupName
        | "rec" "=" Expr
        | "iostat" "=" ScalarVariable
        | "err" "=" LblRef
        | "end" "=" LblRef
        | "advance" "=" CExpr
        | "size" "=" Variable
        | "eor" "=" LblRef
 ;
syntax InputItemList
        = 
        InputItem ("," InputItem)*
 ;
syntax InputItem
        = Name
        | DataRef
        | InputImpliedDo
 ;
syntax InputImpliedDo
        = "(" InputItemList "," ImpliedDoVariable "=" Expr "," Expr ")"
        | "(" InputItemList "," ImpliedDoVariable "=" Expr "," Expr "," Expr ")"
 ;
syntax RdFmtId
        = LblRef
        | "*"
        | COperand
        | COperand ConcatOp CPrimary
        | RdFmtIdExpr ConcatOp CPrimary
 ;
syntax RdFmtIdExpr
        = 
        "(" UFExpr ")"
 ;
syntax ReturnStmt
        = 
        LblDef "return" Expr? EOS
 ;
syntax RewindStmt
        = LblDef "rewind" UnitIdentifier EOS
        | LblDef "rewind" "(" PositionSpec ("," PositionSpec)* ")" EOS
 ;
syntax StopStmt
        = 
        LblDef "stop" (Icon | Scon)? EOS
 ;
syntax WriteStmt
        = 
        LblDef "write" "(" IoControlSpecList ")" OutputItemList? EOS
 ;
syntax IoControlSpecList
        = UnitIdentifier "," FormatIdentifier?
        | UnitIdentifier "," IoControlSpec
        | IoControlSpec
        | IoControlSpecList "," IoControlSpec
 ;
syntax DoConstruct
        = BlockDoConstruct
        | LabelDoStmt
 ;
syntax BlockDoConstruct
        = LblDef "do" LblRef EOS
        | LblDef "do" LoopControl EOS
        | LblDef "do" EOS
        | LblDef Name ":" "do" LblRef LoopControl EOS
        | LblDef Name ":" "do" LblRef EOS
        | LblDef Name ":" "do" LoopControl EOS
        | LblDef Name ":" "do" EOS
 ;
syntax LoopControl
        = "while" "(" Expr ")"
        | VariableName "=" Int_Real_Dp_Expression "," Int_Real_Dp_Expression ("," Int_Real_Dp_Expression)?
 ;
syntax Int_Real_Dp_Expression
        = 
        Expr
 ;
syntax LabelDoStmt
        = 
        LblDef "do" LblRef ","? LoopControl EOS
 ;
syntax IfConstruct
        = 
        IfThenStmt ExecutionPartConstruct* (ElseIfStmt ExecutionPartConstruct*)* (ElseStmt ExecutionPartConstruct*)? EndIfStmt
 ;
syntax IfThenStmt
        = 
        LblDef (IfConstructName ":")? "if" "(" ScalarLogicalExpr ")" "then" EOS
 ;
syntax IfConstructName
        = 
        Ident
 ;
syntax ExecutionPartConstruct
        = ExecutableConstruct
        | FormatStmt
        | DataStmt
        | EntryStmt
 ;
syntax ElseIfStmt
        = 
        LblDef "else" "if" "(" ScalarLogicalExpr ")" "then" IfConstructName? EOS
 ;
syntax ElseStmt
        = 
        LblDef "else" IfConstructName? EOS
 ;
syntax EndIfStmt
        = 
        LblDef "end" "if" IfConstructName? EOS
 ;
syntax CaseConstruct
        = LblDef Name ":" "select" "case" "(" Expr ")" EOS SelectCaseRange
        | LblDef "select" "case" "(" Expr ")" EOS SelectCaseRange
 ;
syntax SelectCaseRange
        = SelectCaseBody EndSelectStmt
        | EndSelectStmt
 ;
syntax SelectCaseBody
        = 
        CaseBodyConstruct+
 ;
syntax CaseBodyConstruct
        = CaseStmt
        | ExecutionPartConstruct
 ;
syntax CaseStmt
        = 
        LblDef "case" CaseSelector Name? EOS
 ;
syntax CaseSelector
        = "(" CaseValueRange ("," CaseValueRange)* ")"
        | "default"
 ;
syntax CaseValueRange
        = Expr
        | Expr ":"
        | ":" Expr
        | Expr ":" Expr
 ;
syntax EndSelectStmt
        = 
        LblDef "end" "select" EndName? EOS
 ;
syntax WhereConstruct
        = 
        WhereConstructStmt AssignmentStmt* (ElsewhereStmt AssignmentStmt*)? EndWhereStmt
 ;
syntax WhereConstructStmt
        = 
        LblDef "where" "(" MaskExpr ")" EOS
 ;
syntax ElsewhereStmt
        = 
        LblDef "elsewhere" EOS
 ;
syntax EndWhereStmt
        = 
        LblDef "end" "where" EOS
 ;
syntax EndDoStmt
        = 
        LblDef "end" "do" Name? EOS
 ;
syntax EndProgramStmt
        = LblDef "end" EOS
        | LblDef "end" "program" EndName? EOS
 ;
syntax InternalSubProgPart
        = Body ContainsStmt InternalSubprogram
        | ContainsStmt InternalSubprogram
        | InternalSubProgPart InternalSubprogram
 ;
syntax Body
        = 
        BodyConstruct+
 ;
syntax ContainsStmt
        = 
        LblDef "contains" EOS
 ;
syntax InternalSubprogram
        = FunctionSubprogram
        | SubroutineSubprogram
 ;
syntax FunctionSubprogram
        = 
        LblDef FunctionPrefix FunctionName FunctionRange
 ;
syntax FunctionRange
        = FunctionParList EOS Body? EndFunctionStmt
        | FunctionParList "result" "(" Name ")" EOS InternalSubProgPart EndFunctionStmt
        | FunctionParList "result" "(" Name ")" EOS Body EndFunctionStmt
        | FunctionParList "result" "(" Name ")" EOS EndFunctionStmt
        | FunctionParList EOS InternalSubProgPart EndFunctionStmt
 ;
syntax SubroutineSubprogram
        = 
        LblDef "recursive"? "subroutine" SubroutineName SubroutineRange
 ;
syntax SubroutineRange
        = SubroutineParList? EOS Body? EndSubroutineStmt
        | SubroutineParList EOS InternalSubProgPart EndSubroutineStmt
 ;
syntax Module
        = ModuleStmt ModuleBody EndModuleStmt
        | ModuleStmt EndModuleStmt
 ;
syntax ModuleStmt
        = 
        LblDef "module" ModuleName EOS
 ;
syntax ModuleName
        = 
        Ident
 ;
syntax ModuleBody
        = SpecificationPartConstruct
        | ModuleSubprogramPartConstruct
        | ModuleBody SpecificationPartConstruct
        | ModuleBody ModuleSubprogramPartConstruct
 ;
syntax ModuleSubprogramPartConstruct
        = ContainsStmt
        | ModuleSubprogram
 ;
syntax ModuleSubprogram
        = FunctionSubprogram
        | SubroutineSubprogram
 ;
syntax EndModuleStmt
        = LblDef "end" EOS
        | LblDef "end" "module" EndName? EOS
 ;
syntax BlockDataSubprogram
        = BlockDataStmt BlockDataBody EndBlockDataStmt
        | BlockDataStmt EndBlockDataStmt
 ;
syntax BlockDataStmt
        = 
        LblDef "block" "data" BlockDataName? EOS
 ;
syntax BlockDataName
        = 
        Ident
 ;
syntax BlockDataBody
        = 
        BlockDataBodyConstruct+
 ;
syntax BlockDataBodyConstruct
        = 
        SpecificationPartConstruct
 ;
syntax EndBlockDataStmt
        = LblDef "end" "block" "data" EndName? EOS
        | LblDef "end" EOS
 ;
