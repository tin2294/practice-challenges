file_name = "lib/source-text.txt"
file_name2 = "lib/stop_words.txt"

def stop_words(file_name2)
  words = []
  File.open(file_name2, 'r').each_line do |line|
    # Do something with the line variable
    words << line.scan(/.+/)
  end
  words.flatten
end

# puts stop_words(file_name2)

def read_file(file_name, file_name2)
  stop = stop_words(file_name2)
  words = []
  File.open(file_name, 'r').each_line do |line|
    # Do something with the line variable
    words << line.split(/\b/).reject { |word| word.match?(/[^a-zA-Z]+/) }
  end
  words = words.flatten.map(&:downcase)
  words.reject { |word| stop.include?(word) }
end

# read_file(file_name2)

def most_common_words(file_name, stop_words_file_name, number_of_word)
  array = read_file(file_name, stop_words_file_name)
  hash = Hash.new(0)
  array.each do |word|
    if hash.keys.include?(word)
      hash[word] += 1
    else
      hash[word] = 1
    end
  end
  return hash.sort_by { |key, value| value }.last(number_of_word).to_h
  # TODO: return hash of occurences of number_of_word most frequent words
end

most_common_words(file_name, file_name2, 6)
