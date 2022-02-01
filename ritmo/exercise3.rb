# This method takes in an array of numbers and slices it into mini arrays based
# on whether the values are consecutive or not. We return the max of the lengths
# of the mini arrays
def consecutives_length(num_array)
  # First, we sort the array in ascending order
  array = num_array.sort
  # Second, we slice the resulting sorted array based on whether the numbers are
  # consecutive or not (if the previous' number's next number is different from
  # our current number we are dealing with we slice).
  array = array.slice_when { |prev, curr| curr != prev.next }.to_a
  # Next, we create an array of the lengths of each of the mini arrays
  lengths = array.map { |mini_arr| mini_arr.length }
  # Finally, we return the max length of the array of lengths
  return lengths.max
end

nums = [0,3,7,2,5,8,4,6,0,1]
p consecutives_length(nums)
