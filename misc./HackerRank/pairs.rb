def findPairs(array, k)
  pairs = []
  array.each_with_index do |number, index|
    array[0..(index)].each do |mini|
      pairs << [mini, number] if (((mini + number) % k) == 0) && (mini != number)
    end
  end
  pairs.length
end
array = [1,2,3,4,5,6]
k = 2

p findPairs(array,k)
