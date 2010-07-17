module Flewt::Node
  class AST
    def initialize *nodes
      @nodes = nodes
    end

    def << node
      @nodes << node
      self
    end
  end

  class Data < Struct.new(:label, :constructors)
  end

  class Literal < Struct.new(:label)
  end
end
