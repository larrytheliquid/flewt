require 'flewt'

describe Flewt do
  def self.spec_code code
    it code do
      ast = Flewt::Parser.new.parse code
      p ast if ENV['DEBUG']
      ast.should be_kind_of(Flewt::Node::AST)
    end
  end
    
  describe "<data>" do
    ["(data Bottom)", "(data Bool true false)",
     "(data Method get put post delete)"].each do |record|
      spec_code record
    end
  end
end
