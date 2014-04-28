class Statement
  def initialize(statement_string)
    if statement_string.end_with?(';') == false 
      raise ArgumentError.new('Invalid statement! Must end with semicolon (;)')
    end
  end
end