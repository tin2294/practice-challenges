def sockMerchant(n, ar)
  # Write your code here
  hash = {}
  ar.each do |color|
    if hash.keys.include?(color)
      hash[color] += 1
    else
      hash[color] = 1
    end
  end
  final = hash.keys.sum { |data| hash[data] / 2 }
  return final
end

n = 9
ar = [10, 20, 20, 10, 10, 30, 50, 10, 20]


# p sockMerchant(n, ar)

def break_down_array(arr)
  new_array = []
  arr.each_with_index do |step, index|
    if index == 0
      new_array << [step]
    elsif arr[index-1] == step
      new_array[-1] << step
    elsif arr[index-1] != step
      new_array << [step]
    end
  end
  return new_array
end

def countingValleys(steps, path)
  # Write your code here
  level = 0
  valleys = 0
  path.split("").each_with_index do |step, index|
    case step
    when "U"
      level += 1
    when "D"
      level -= 1
    end
    valleys += 1 if (level == 0 && step == "U")
  end
  return valleys
end

# def countingValleys(steps, path)
#   # Write your code here
#   array = path.split("")
#   sea = 0
#   array.each_with_index do |letter, index|
#     if index == 0
#       case letter
#       when "U"
#         sea += 1
#       when "D"
#         sea -= 1
#       end
#     end
#   end
# end

# return 2
steps1 = 12
path1 = "DDUUDDUDUUUD"

puts "expect 2 got #{countingValleys(steps1, path1)}"

p '///'

# return 0
steps2 = 10
path2 = "UDUUUDUDDD"

puts "expect 0 got #{countingValleys(steps2, path2)}"
