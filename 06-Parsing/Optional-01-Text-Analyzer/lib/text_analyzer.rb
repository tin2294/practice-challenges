def exclude_spaces(text)
  text.gsub(/\s/, '')
end

def analyze(text)
  # TODO: should analyze the text, and return the result hash with all features
  hash = {
    character_count: text.length,
    character_count_excluding_spaces: text.gsub(/\s/, '').length,
    line_count: text.scan(/$/).length,
    word_count: text.scan(/\b/).length,
    sentence_count: text.scan(/\./).length
  }
  return hash
end


    # paragraph_count:
    # if text.scan(/\n/).length.zero?
    #   1.0
    # else
    #   text.scan(/\n/).length.to_f
    # end,
    # average_words_per_sentence: text.scan(/\b/).length / text.scan(/\./).length,
    # average_sentences_per_paragraph: text.scan(/\./).length / (
    # if text.scan(/\n/).length.zero?
    #   1.0
    # else
    #   text.scan(/\n/).length.to_f
    # )
    # end

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
