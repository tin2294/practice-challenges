# def clean_array(array)
#   array.each_with_index do |binary, index|
#     if (index > 0) && (index < (array.length - 1))
#       if (array[index - 1] == 0 && array[index + 1] == 0)
#         array.delete_at(index)
#       end
#     end
#   end
#   return array
# end

# def jumpingOnClouds(c)
#   # Write your code here
#   final = []
#   c.each_with_index do |cloud, index|
#     if index == 0
#       final << 1
#     elsif index == (c.length - 1)
#       final << 0
#     else
#       final << cloud
#     end
#   end
#   return (clean_array(final) - [1]).length
# end


# def jumpingOnClouds(c)
#   # Write your code here
#   final = []
#   c.each_with_index do |cloud, index|
#     if index == 0
#       final << "X"
#     elsif index == (c.length - 1)
#       final << "O"
#     elsif cloud == 1
#       final << "X"
#     elsif c[index - 1] == 1
#       final << "O"
#     elsif (c[index - 1] == 0) & (c[index - 2] == 0) && (index > 1)
#       final << "O"
#     else
#       final << "?"
#     end
#   end
#   # return final.count("O")
#   return final
# end

# def jumpingOnClouds(c)
#   # Write your code here
#   final = []
#   c.each_with_index do |cloud, index|
#     if index == 0
#       final << "X"
#     elsif index == (c.length - 1)
#       final << "O"
#     elsif cloud == 1
#       final << "X"
#     elsif (index == 1) && cloud == 0
#       final << "O"
#     elsif (index > 1) && (index < (c.length - 2))
#       final << "O" if (c[index - 1] == 1) || (c[index + 1] == 1)
#     else
#       final << "X"
#     end
#   end
#   return final.count("O")
# end

def jumpingOnClouds(c)
  # Write your code here
  step = 0
  jumps = []
  c.each_with_index do |cloud, index|
    if (index == (step + 2)) && (cloud == 0)
      step = index
      jumps << index
    elsif (index == (step + 1)) && (cloud == 0) && (c[step + 2] == 1)
      step = index
      jumps << index
    elsif index == (c.length - 1)
      step = index
      jumps << index
    elsif (index == 1) && (cloud == 0) && (c[2] == 1)
      step = index
      jumps << index
    end
  end
  return jumps.length
end

# test 1 expect 3
c = [0,1,0,0,0,1,0]
p jumpingOnClouds(c)

# test 2 expect 3
d = [0,0,0,1,0,0]
p jumpingOnClouds(d)

# test 3 expect 4
e = [0,0,1,0,0,1,0]
p jumpingOnClouds(e)
