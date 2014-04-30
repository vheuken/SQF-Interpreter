class Statement
  def initialize(statement_str)
    if statement_str.end_with?(';') == false 
      raise ArgumentError.new('Invalid statement! Statements must end with semicolon (;)')
    end
    
    @normalized_statement_str = normalize(statement_str)
  end
  
  def normalize(statement_str)
    return statement_str.gsub('\n', ' ')
  end
  
  def to_str
    @normalized_statement_str
  end
end