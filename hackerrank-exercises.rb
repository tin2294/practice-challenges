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


p sockMerchant(n, ar)
