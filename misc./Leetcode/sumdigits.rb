def add_digits(num)
  arr = num.to_s.split('')
  mapped_sum = arr.map(&:to_i).sum
  if mapped_sum.to_s.split('').length == 1
    return mapped_sum
  else
    add_digits(mapped_sum.to_s)
  end
  # final_number = 0
  # while num.to_s.split('').map(&:to_i).sum.to_s.split('').length != 1
  #   num = num.to_s.split('').map(&:to_i).sum
  #   add_digits(num)
  #   final_number = num
  # end
  # return final_number.to_s.split('').map(&:to_i).sum
end
# def add_digits(num)
#   result = 0;
#   num = num.to_s.split("")
#   num.each do |x|
#     result += x.to_i
#   end
#   if result.to_s.split("").length == 1
#     return result.to_i
#   else
#     add_digits(result)
#   end
# end

num = 38
p add_digits(num)
