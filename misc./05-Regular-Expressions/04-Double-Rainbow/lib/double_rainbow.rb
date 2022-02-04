def word_contains_two_p(sentence)
  # TODO: return the first word in `sentence` containing two 'p's
  result = sentence.split.map(&:to_s)
  result.find { |word| word.match?(/.*p.*p.*/) }
end

# secret_message = "Reveal the logos' colors:\
#  Elegant shapes, some have evolved to a very iconized style.\
#  Definitely a vivid color scheme with bright orange and shiny yellow,\
#  many shades of blue, oscillating between purple and indigo! but not much green"

# word_contains_two_p(secret_message)

def word_before_exclamation_mark(sentence)
  # TODO: return the first word located before an exclamation mark
  # Hint: you may want to use `()` groups!
  result = sentence.split.map(&:to_s)
  word = result.find { |word| word.match?(/.+!/) }
  word.gsub('!', '')
end

# test_string = "you? me!"
# p word_before_exclamation_mark(test_string)

def four_letter_word(sentence)
  # TODO: return the first four-letter word starting with 'b', followed with a comma `,`
  result = sentence.split.map(&:to_s)
  word = result.find { |word| word.match?(/b.+,/) }
  word.gsub(',', '')
end

def last_five_letters(sentence)
  return sentence.match(/\w{5}\z/).to_s
  # TODO: return the last five letters of the sentence
end

def word_contains_ll(sentence)
  # TODO: return the first word containing two consecutive 'l'
  result = sentence.split.map(&:to_s)
  word = result.find { |word| word.match?(/.*ll.*/) }
  if word.match?(/[^a-zA-Z]/)
    word.gsub(word.match(/[^a-zA-Z]/).to_s, "")
  else
    word
  end
end

def six_letter_word(sentence)
  # TODO: return the first six-letter word, composed of letters from 'a' to 'r'
  result = sentence.split.map(&:to_s)
  result.find { |word| word.match?(/[a-rA-R]{6}\b/) }
end

def all_capital_letters(sentence)
  # TODO: return all the capital letters as a string
  # Hint: use `scan` to get all the occurences then `join` them
  sentence.scan(/[A-Z]/).join
end
test_string = "ManY COLORS"
p all_capital_letters(test_string)
