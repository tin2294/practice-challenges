arr = [
  [1,1,1,0,0,0],
  [0,1,0,0,0,0],
  [1,1,1,0,0,0],
  [0,0,2,4,4,0],
  [0,0,0,2,0,0],
  [0,0,1,2,4,0]
]

def hourglassSum(arr)
    # Write your code here
  sums_arr = []
  sum = 0
  arr.each_with_index do |col, index|
    if ((index == 0) || (index == 1) || (index == 2) || (index == 3))
      col.each_with_index do |row, ind|
        if ((ind == 0) || (ind == 1) || (ind == 2) || (ind == 3))
          sum = row + col[ind + 1] + col[ind + 2] + arr[index + 1][ind + 1] + arr[index + 2][ind] + arr[index + 2][ind + 1] + arr[index + 2][ind + 2]
          sums_arr << sum
        end
      end
    end
  end
  return sums_arr.max
end

hourglassSum(arr)
