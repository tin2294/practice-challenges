def is_valid(s)
  string = s.split('()').join.split('[]').join.split('{}')
  until string == []
    if string.join.include?('()') || string.join.include?('[]') || string.join.include?('{}')
      string = string.join.split('()').join.split('[]').join.split('{}')
    else
      return false
    end
  end
  return true
end

s = "([[][]{({}({}))}])"
p is_valid(s)
# p is_valid(is_valid(s))
