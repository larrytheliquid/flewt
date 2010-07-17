class Flewt::Lexer
  KEYWORDS = %w[data fun]

  def tokenize code
    code = code.strip
    code_size = code.size
    i , tokens = 0, []

    while i < code_size
      chunk = code[i..-1]

      if false
        # noop

      elsif space = chunk[/\A(\s+)/, 1]
        i += space.size

      else token = chunk[0,1]
        tokens << [token, token]
        i += 1
      end
    end

    tokens
  end
end
