def read_file(file)
  text_file = []
  File.open(file, "r") do |f|
    f.each_line do |line|
      text_file += line.downcase.split
    end
  end
  return text_file
end

def read_stop_file(file2)
  stop_file = []
  File.open(file2, "r") do |f|
    f.each_line do |line|
      stop_file += line.downcase.split
    end
  end
  return stop_file
end

def clean_text_file(text_file)
  text_file2 = []
  text_file.each do |word|
    text_file2 << word.gsub(/'[a-zA-Z]*/, "").chomp('.').chomp(',')
  end
  return text_file2
end

def most_common_words(file_name, stop_words_file_name, number_of_word)
  stop_file = read_stop_file(stop_words_file_name)
  text_file = read_file(file_name)
  text_file2 = clean_text_file(text_file)
  text_file2 -= stop_file
  text_file2.delete('-')
  new_hash = text_file2.tally
  new_hash2 = {}
  highest_values = new_hash.values.max(number_of_word)
  new_hash.select { |k, v| new_hash2[k] = v if highest_values.include?(v) }
end

p most_common_words("spec/obama.txt", "lib/stop_words.txt", 6)
