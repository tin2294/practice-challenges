def paragraph(text)
  if text.scan(/\n/).length.zero?
    1
  else
    text.scan(/\n/).length.to_f
  end
end

def word_count(text)
  text.split.size
end

def sentence(text)
  text.scan(/\./).length
end

def average_words(text)
  word_count(text).to_f / sentence(text)
end

def average_sentences(text)
  sentence(text).to_f / paragraph(text)
end

def analyze(text)
  # TODO: should analyze the text, and return the result hash with all features
  {
    character_count: text.length,
    character_count_excluding_spaces: text.gsub(/\s/, '').length,
    line_count: text.scan(/$/).length,
    word_count: word_count(text),
    sentence_count: sentence(text),
    paragraph_count: paragraph(text),
    average_words_per_sentence: average_words(text),
    average_sentences_per_paragraph: average_sentences(text)
  }
end


    # paragraph_count:
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
