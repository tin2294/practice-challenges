nums = [0,3,7,2,5,8,4,6,0,1]

def consecutives_length(num_array)
  array = num_array.sort
  array = array.slice_when { |prev, curr| curr != prev.next }.to_a
  lengths = array.map { |mini_arr| mini_arr.length }
  return lengths.max
end

p consecutives_length(nums)
