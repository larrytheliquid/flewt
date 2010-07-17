class Flewt::Parser

# Expressions
token LITERAL

# Statements
token DATA

rule
  Statements:
    Statement                                         { result = Node::AST.new val[0] }
  | Statements Statement                              { result = val[0] << val[1] }
  ;

  Statement:
    '(' DATA LITERAL Constructors ')'                 { result = Node::Data.new val[2], val[3] }
  ;

  Constructors:
    Constructor                                       { result = Array.[] val[0] }
  | Constructors Constructor                          { result = val[0] << val[1] }
  ;

  Constructor:
    LITERAL                                           { result = Node::Literal.new val[0] }
  ;
end

---- header
  require "#{File.dirname __FILE__}/lexer"
  require "#{File.dirname __FILE__}/nodes"

---- inner
  def parse code
    @tokens = Flewt::Lexer.new.tokenize code
    do_parse
  end

  def next_token
    @tokens.shift
  end
