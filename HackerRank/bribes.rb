# def minimumBribes(q)
#     # Write your code here
#   bribes = []
#   q.each_with_index do |person, index|
#     if q.last != person
#       # person has to be 1 or 2 greater than the next person in line
#       bribes << (person - q[index + 1]) if person > q[index + 1]
#     end
#   end
#   result = ""
#   bribes.each do |bribe|
#     result = "Too chaotic" if bribe > 2
#   end
#   if result == "Too chaotic"
#     puts result
#   else
#     result = bribes.sum
#     puts result
#   end
# end

# def minimumBribes(q)
#     # Write your code here
#   bribes = []
#   compare = []
#   number = 1
#   for i in (1..q.length)
#     compare << number
#     number += 1
#   end
#   q.each_with_index do |person, index|
#     diff = person - compare[index]
#     bribes << diff
#     #  if (diff > 0)
#     # bribes << 0 if (diff < 1)
#   end
#   p bribes
#   result = ""
#   bribes.each do |bribe|
#     result = "Too chaotic" if bribe > 2
#   end
#   if result == "Too chaotic"
#     puts result
#   else
#     result = bribes.sum
#     puts result
#   end
# end

# def minimumBribes(q)
#     # Write your code here
  # bribes = []
  # compare = []
  # number = 1
  # for i in (1..q.length)
  #   compare << number
  #   number += 1
  # end
#   p q
#   p compare
#   p '-----'
#   # until compare == q
#     q.each_with_index do |person, index|
#       diff = person - compare[index]
#       if ((diff != 0) && (q.last != person))
#         compare[index + 1], compare[index] = compare[index], compare[index + 1]
#       end
#       p compare
#     end
#   # end
#   # p bribes
#   result = ""
#   bribes.each do |bribe|
#     result = "Too chaotic" if bribe > 2
#   end
#   if result == "Too chaotic"
#     puts result
#   else
#     result = bribes.sum
#     puts result
#   end
# end

# def minimumBribes(q)
#   bribes = []
#   q.each_with_index do |number, index|
#     p number
#     if index != (q.length - 1)
#       if (q[index + 1] - number) < 0
#         p (q[index + 1])
#         bribes << (number - (index + 1)).abs
#       end
#     end
#     p bribes
#   end
# end

# def minimumBribes(q)
#     # Write your code here
#   bribes = []
#   differences = []
#   q.each_with_index do |number, index|
#     sum = 0
#     differences << (number - (index + 1))
#     for i in (0..index)
#       if q[i] > number
#         sum += 1
#       end
#     end
#     bribes << sum
#   end
#   if differences.any?{|x| x >= 3 }
#     puts "Too chaotic"
#   else
#     puts bribes.sum
#   end
# end


def minimumBribes(q)
    # Write your code here
  bribe = 0
  for j in (q.length - 1).downto(0)
    if (q[j] - (j + 1) > 2)
      puts "Too chaotic"
      return
    end
    for i in (0..(j-1))
      if q[i] > q[j]
      bribe += 1
      end
    end
  end
  puts bribe
end

q = [1,2,5,3,7,8,6,4]

minimumBribes(q)

def minimumBribes(q)
  bribe = 0
  for j in (q.length - 1).downto(0)
    if (q[j] - (j + 1)) > 2
      puts "Too chaotic"
      return
    end

    for i in [q[j]-2, 0].max..j
      if q[i] > q[j]
      bribe += 1
      end
    end
  end
  puts bribe
end
