class String
  def opener?
    self == '[' || self == '{' || self == '('
  end

  def closer?
    self == ']' || self == '}' || self == ')'
  end
end

def validate_parens(str)
  stack = []
  str.chars.each do |c|
    if c.opener?
      stack.push(c)
    elsif c.closer?
      if stack.empty?
        raise "trying to close but never opened"
      elsif stack[-1].opener?
        closer = stack.pop
      else
        raise "trying to close with '#{c}' but was '#{closer}'"
      end
    end
  end

  raise "there is litter" unless stack.empty?
end

validate_parens("{{{{{1}}}}}")
