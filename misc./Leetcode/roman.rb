ROMAN = {
  'I' =>             1,
  'V' =>             5,
  'X' =>             10,
  'L' =>             50,
  'C' =>             100,
  'D' =>             500,
  'M' =>             1000,
  'CM'=>             900,
  'CD'=>             400,
  'XC'=>             90,
  'XL'=>             40,
  'IX'=>             9,
  'IV'=>             4,
  '0' =>             0
}

def roman_to_int(s)
  numbers = []
  s_arr = s.split('')
  p s_arr
  s_arr.each_with_index do |letter, index|
    p letter
    p index
    # p "#{letter} #{index}" if letter == "C" && (s_arr[index + 1] == "D" || s_arr[index + 1] == "M")
    # p letter + s_arr[index + 1] if letter == "C" && (s_arr[index + 1] == "D" || s_arr[index + 1] == "M")
    if letter == "I" && (s_arr[index + 1] == "V" || s_arr[index + 1] == "X")
      numbers << ROMAN[letter + s_arr[index + 1]]
      s_arr[index + 1] = "0"
    elsif letter == "X" && (s_arr[index + 1] == "L" || s_arr[index + 1] == "C")
      numbers << ROMAN[letter + s_arr[index + 1]]
      s_arr[index + 1] = "0"
    elsif letter == "C" && (s_arr[index + 1] == "D" || s_arr[index + 1] == "M")
      numbers << ROMAN[letter + s_arr[index + 1]]
      s_arr[index + 1] = "0"
    else
      numbers << ROMAN[letter]
    end
  end
  numbers.sum
end

# shorter solution that uses counters and resets
# def roman_to_int(s)
#     res = 0
#     temp = 0
#     s.chars.each_with_index do |el, i|
#         if ROM_NUMS[s[i + 1]] && ROM_NUMS[el] < ROM_NUMS[s[i+1]]
#             temp = ROM_NUMS[el]
#         else
#             res += (ROM_NUMS[el] - temp)
#             temp = 0
#         end
#     end
#     res
# end


# cases: IV, IX, XL, XC, CD (400), CM (900)

s = "LVIII"
# s = "MCMXCIV"

p roman_to_int(s)
