def exclude_spaces(text)
  text.gsub(/\s/, '')
end

def analyze(text)
  # TODO: should analyze the text, and return the result hash with all features
  {
    character_count: text.length,
    character_count_excluding_spaces: text.gsub(/\s/, '').length,
    line_count: text.scan(/$/, '').length
  }
end

test_string = "I love programming."

puts analyze(test_string)

# {
#   character_count: 523,
#   character_count_excluding_spaces: 463,
#   line_count: 42,
#   word_count: 145,
#   sentence_count: 32,
#   paragraph_count: 4,
#   average_words_per_sentence: 4.53,
#   average_sentences_per_paragraph: 8
# }
