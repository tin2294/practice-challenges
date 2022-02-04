def RemoveLetters(s, letters)
  # Write your code here
  string = s.split("")
  letters.each do |letter|
    string.delete(letter)
  end
  string.join
end

s = "Apples and pears"
letters = ['p', 'A']
p RemoveLetters(s,letters)
