require 'open-uri'
require 'json'

def search_api(word)
  url = "https://wagon-dictionary.herokuapp.com/#{word}"
  user_serialized = URI.open(url).read
  user = JSON.parse(user_serialized)
end

def generate_grid(grid_size)
  grid_size.times.map { ('a'..'z').to_a.sample }
end

def run_game(attempt, grid, start_time, end_time)
  hash = {}
  word_hash = search_api(attempt)["found"]
  hash[:time] = end_time - start_time
  grid = grid.map(&:downcase)
  if word_hash == true
    letters = attempt.downcase.split('')
    letters.each do |letter|
      if grid.include?(letter)
        grid.delete_at(grid.index(letter))
        hash[:message] = 'Well done!'
        hash[:score] = letters.length - hash[:time]
      else
        hash[:message] = 'not in the grid'
        hash[:score] = 0
        break
      end
    end
  else
    hash[:message] = 'Sorry, that is not an English word'
    hash[:score] = 0
  end
  # TODO: runs the game and return detailed hash of result (with `:score`, `:message` and `:time` keys)
  hash
end

# grid = generate_grid(9)
# puts grid.join(" ")

# start_time = Time.now
# attempt = gets.chomp
# end_time = Time.now

# run_game(attempt, grid, start_time, end_time)
