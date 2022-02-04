def repeatedString(s, n)
  # Write your code here
  array = s.split('')
  array_a = array.count('a')
  quotient = n / array.length
  remainder = (n.to_i % array.length.to_i)
  array_a * quotient + array.first(remainder).count('a')
end

s = 'a'
n = 1000000000000

p repeatedString(s, n)
