# def is_valid(s)
#   string = s.split('()').join.split('[]').join.split('{}')
#   until string == []
#     if string.join.include?('()') || string.join.include?('[]') || string.join.include?('{}')
#       string = string.join.split('()').join.split('[]').join.split('{}')
#     else
#       return false
#     end
#   end
#   return true
# end

# other simple solution
def is_valid(s)
    return true if s.empty?

    stack = []
    s.each_char do |c|
      p c
        case c
        when '(', '{', '['
            stack.push(c)
        when ')'
            return false if stack.pop() != '('
        when '}'
            # it pops it regardless but returns false if the pop does not equal the condition
            return false if stack.pop() != '{'
        when ']'
            return false if stack.pop() != '['
        end
      p stack
    end
    return stack.empty?
end

s = "([[][]{({}({}))}])"
p is_valid(s)
# p is_valid(is_valid(s))
