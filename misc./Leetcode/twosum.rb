# SUPER LONG RUNNING
# def two_sum(nums, target)
#   result = []
#   nums.each_with_index do |num, index|
#     ((index + 1)..(nums.length - 1)).each do |mini_index|
#       result << [index, mini_index] if nums[mini_index] + num == target
#     end
#   end
#   return result.flatten
# end

# super cool solution using hash
def two_sum(nums, target)
  dict = {}
  nums.each_with_index do |n, i|
    if dict[target - n]
      return dict[target - n], i
    end
    dict[n] = i
  end
end

nums = [3,2,4]
target = 6
p two_sum(nums, target)
