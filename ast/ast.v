module ast

import token

pub type Node = LetStatement | ReturnStatement

pub type Statement = FnStatement | LetStatement | ReturnStatement

pub type Expression = FnStatement | Identifier | IntegerExpression | StringExpression

pub struct Program {
	statements []Statement
}

pub fn (p Program) token_literals() string {
	if p.statements.len > 0 {
		return p.statements[0].token_literal()
	}
	return ''
}

pub struct Identifier {
	token token.Token
	value string
}

pub fn (ident Identifier) expression_node() {
}

pub fn (stmt Statement) token_literal() string {
	return 'TODO'
}

pub struct LetStatement {
	token     token.Token
	name      Identifier
	has_value bool
	value     Expression
}

pub struct StringExpression {
	value string
}

pub struct IntegerExpression {
	value string
}

pub struct ReturnStatement {
	token        token.Token // the `return` token
	return_value Expression
}

fn (rs ReturnStatement) token_literal() string {
	return rs.token.literal
}

pub struct FnStatement {
	token     token.Token
	anonym    bool
	name      Identifier
	parameter []Identifier
	stmts     []Statement
}
