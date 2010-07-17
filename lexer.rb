class Flewt::Lexer
  KEYWORDS = %w[data]

  def tokenize code
    code = code.strip
    code_size = code.size
    i , tokens = 0, []

    while i < code_size
      chunk = code[i..-1]

      if literal = chunk[/\A[A-Za-z][-\w]*/]
        tokens << if KEYWORDS.include?(literal)
          [literal.upcase.to_sym, literal]
        else
          [:LITERAL, literal]
        end
        i += literal.size

      elsif space = chunk[/\A\s+/]
        i += space.size

      else token = chunk[0,1]
        tokens << [token, token]
        i += 1
      end
    end

    tokens
  end
end
