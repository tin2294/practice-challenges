def word_contains_two_p(sentence)
  # TODO: return the first word in `sentence` containing two 'p's
  regexp = /\b\w*p\w*p\w*\b/
  sentence.match(regexp)[0]
end

def word_before_exclamation_mark(sentence)
  # TODO: return the first word located before an exclamation mark
  # Hint: you may want to use `()` groups!
  return sentence[/\w+?(?=!)/]
end

test_string = "you? me!"
p word_before_exclamation_mark(test_string)

def four_letter_word(sentence)
  # TODO: return the first four-letter word starting with 'b', followed with a comma `,`
  return sentence[/\bb.{3}\b/]
end

def last_five_letters(sentence)
  # TODO: return the last five letters of the sentence
  return sentence[/.{5}$/]
end

def word_contains_ll(sentence)
  # TODO: return the first word containing two consecutive 'l'
  return sentence[/\b\w*ll\w*\b/]
end

def six_letter_word(sentence)
  # TODO: return the first six-letter word, composed of letters from 'a' to 'r'
  return sentence[/\b[a-r]{6}\b/]
end

def all_capital_letters(sentence)
  # TODO: return all the capital letters as a string
  # Hint: use `scan` to get all the occurences then `join` them
  arr_word = sentence.scan(/[A-Z]/)
  return arr_word.join
end
