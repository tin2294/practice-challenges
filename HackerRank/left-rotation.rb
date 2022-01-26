def rotLeft(a, d)
    # Write your code here
  a.rotate(d)
  # new_array = []
  # new_array << a[d]
  # last_index = (a.length - 1) - d
  # for a in (1..last_index)
  #   d += 1
  #   new_array << a[d]
  # end
  # length_left = a.length - new_array.length
  # count = 0
  # for b in (1..length_left)
  #   new_array << a[count]
  #   count += 1
  # end
  # return new_array
end

a = [1,2,3,4,5]
d = 4

p rotLeft(a, d)
