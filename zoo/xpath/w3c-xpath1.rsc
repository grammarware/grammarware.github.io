@contributor{bgf2src automated exporter - SLPS}
module W3c_xpath1

syntax LocationPath
        = NT-LocationPath: RelativeLocationPath
        | AbsoluteLocationPath
 ;
syntax AbsoluteLocationPath
        = NT-AbsoluteLocationPath: "/" RelativeLocationPath?
        | AbbreviatedAbsoluteLocationPath
 ;
syntax RelativeLocationPath
        = NT-RelativeLocationPath: Step
        | RelativeLocationPath "/" Step
        | AbbreviatedRelativeLocationPath
 ;
syntax Step
        = NT-Step: AxisSpecifier NodeTest Predicate*
        | AbbreviatedStep
 ;
syntax AxisSpecifier
        = NT-AxisSpecifier: AxisName "::"
        | AbbreviatedAxisSpecifier
 ;
syntax AxisName
        = NT-AxisName: "ancestor"
        | "ancestor-or-self"
        | "attribute"
        | "child"
        | "descendant"
        | "descendant-or-self"
        | "following"
        | "following-sibling"
        | "namespace"
        | "parent"
        | "preceding"
        | "preceding-sibling"
        | "self"
 ;
syntax NodeTest
        = NT-NodeTest: NameTest
        | NodeType "(" ")"
        | "processing-instruction" "(" Literal ")"
 ;
syntax Predicate
        = NT-Predicate: 
        "[" PredicateExpr "]"
 ;
syntax PredicateExpr
        = NT-PredicateExpr: 
        Expr
 ;
syntax AbbreviatedAbsoluteLocationPath
        = NT-AbbreviatedAbsoluteLocationPath: 
        "//" RelativeLocationPath
 ;
syntax AbbreviatedRelativeLocationPath
        = NT-AbbreviatedRelativeLocationPath: 
        RelativeLocationPath "//" Step
 ;
syntax AbbreviatedStep
        = NT-AbbreviatedStep: "."
        | ".."
 ;
syntax AbbreviatedAxisSpecifier
        = NT-AbbreviatedAxisSpecifier: 
        "@"?
 ;
syntax Expr
        = NT-Expr: 
        OrExpr
 ;
syntax PrimaryExpr
        = NT-PrimaryExpr: VariableReference
        | "(" Expr ")"
        | Literal
        | Number
        | FunctionCall
 ;
syntax FunctionCall
        = NT-FunctionCall: 
        FunctionName "(" {Argument ","}* ")"
 ;
syntax Argument
        = NT-Argument: 
        Expr
 ;
syntax UnionExpr
        = NT-UnionExpr: PathExpr
        | UnionExpr "|" PathExpr
 ;
syntax PathExpr
        = NT-PathExpr: LocationPath
        | FilterExpr
        | FilterExpr "/" RelativeLocationPath
        | FilterExpr "//" RelativeLocationPath
 ;
syntax FilterExpr
        = NT-FilterExpr: PrimaryExpr
        | FilterExpr Predicate
 ;
syntax OrExpr
        = NT-OrExpr: AndExpr
        | OrExpr "or" AndExpr
 ;
syntax AndExpr
        = NT-AndExpr: EqualityExpr
        | AndExpr "and" EqualityExpr
 ;
syntax EqualityExpr
        = NT-EqualityExpr: RelationalExpr
        | EqualityExpr "=" RelationalExpr
        | EqualityExpr "!=" RelationalExpr
 ;
syntax RelationalExpr
        = NT-RelationalExpr: AdditiveExpr
        | RelationalExpr "\<" AdditiveExpr
        | RelationalExpr "\>" AdditiveExpr
        | RelationalExpr "\<=" AdditiveExpr
        | RelationalExpr "\>=" AdditiveExpr
 ;
syntax AdditiveExpr
        = NT-AdditiveExpr: MultiplicativeExpr
        | AdditiveExpr "+" MultiplicativeExpr
        | AdditiveExpr "-" MultiplicativeExpr
 ;
syntax MultiplicativeExpr
        = NT-MultiplicativeExpr: UnaryExpr
        | MultiplicativeExpr MultiplyOperator UnaryExpr
        | MultiplicativeExpr "div" UnaryExpr
        | MultiplicativeExpr "mod" UnaryExpr
 ;
syntax UnaryExpr
        = NT-UnaryExpr: UnionExpr
        | "-" UnaryExpr
 ;
syntax ExprToken
        = NT-ExprToken: "("
        | ")"
        | "["
        | "]"
        | "."
        | ".."
        | "@"
        | ","
        | "::"
        | NameTest
        | NodeType
        | Operator
        | FunctionName
        | AxisName
        | Literal
        | Number
        | VariableReference
 ;
syntax Number
        = NT-Number: Digits ("." Digits?)?
        | "." Digits
 ;
syntax Operator
        = NT-Operator: OperatorName
        | MultiplyOperator
        | "/"
        | "//"
        | "|"
        | "+"
        | "-"
        | "="
        | "!="
        | "\<"
        | "\<="
        | "\>"
        | "\>="
 ;
syntax OperatorName
        = NT-OperatorName: "and"
        | "or"
        | "mod"
        | "div"
 ;
syntax MultiplyOperator
        = NT-MultiplyOperator: 
        "*"
 ;
syntax VariableReference
        = NT-VariableReference: 
        "$" QName
 ;
syntax NameTest
        = NT-NameTest: "*"
        | NCName ":" "*"
        | QName
 ;
syntax NodeType
        = NT-NodeType: "comment"
        | "text"
        | "processing-instruction"
        | "node"
 ;
syntax ExprWhitespace
        = NT-ExprWhitespace: 
        S
 ;
syntax Digits
        = NT-Digits: 
        ("0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9")+
 ;
