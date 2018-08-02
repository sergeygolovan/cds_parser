grammar CDSDocument;

document
   : namespace (annotation | reference)* artifact
   ;

namespace
    : NAMESPACE path SEMICOLON
    ;

annotation
    : AT path  SEMICOLON
    ;

reference
    : USING quoted_path SEMICOLON
    ;

artifact
    : context
    | entity
    | type
    | view
    ;

context
    : CONTEXT IDENT OPEN_BRACE (annotation | artifact)* CLOSE_BRACE SEMICOLON
    ;

// TODO
entity
    : ENTITY IDENT OPEN_BRACE CLOSE_BRACE SEMICOLON
    ;

// TODO
view
    : VIEW IDENT OPEN_BRACE CLOSE_BRACE
    ;

// TODO
type
    : TYPE IDENT SEMICOLON
    ;

path
    : IDENT (DOT IDENT)*
    ;

quoted_path
    : PATH_IDENT (DOT PATH_IDENT)*
    ;

PATH_IDENT
    : '"' IDENT '"'
    | IDENT
    ;

IDENT
    : CHAR (CHAR | DIGIT | UNDERSCORE)*
    ;

DOT
    : '.'
    ;

AT
    : '@'
    ;

OPEN_BRACE
    : '{'
    ;

CLOSE_BRACE
    : '}'
    ;

COLON
    : ':'
    ;

SEMICOLON
    : ';'
    ;

NAMESPACE
    : 'namespace'
    ;

CONTEXT
    : 'context'
    ;

ENTITY
    : 'entity'
    ;

VIEW
    : 'view'
    ;

TYPE
    : 'type'
    ;

USING
    : 'using'
    ;

fragment
DIGIT
    : [0-9]
    ;

fragment
CHAR
    : CHAR_LOWERCASE
    | CHAR_UPPERCASE
    ;

fragment
CHAR_LOWERCASE
    : [a-z]
    ;

fragment
CHAR_UPPERCASE
    : [A-Z]
    ;


fragment
UNDERSCORE
    : '_'
    ;





















