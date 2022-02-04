def FindCommonElements(array1, array2)
  # Write your code here
  list = []
  array1.each do |number|
    list << number if array2.include?(number)
  end
  list.uniq
end

array1 = [1,2,3,4]
array2 = [3,4,5,6]

p FindCommonElements(array1,array2)
