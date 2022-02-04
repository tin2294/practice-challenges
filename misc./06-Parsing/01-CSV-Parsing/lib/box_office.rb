require 'csv'
require 'date'

filepath = "lib/movies.csv"

def most_successful(number, max_year, file_path)
  # TODO: return the `number` of most successful movies before `max_year`
  movies = []
  CSV.foreach(file_path) do |row|
    # Here, row is an array of columns
    movies << { name: row[0], year: row[1].to_i, earnings: row[2].to_i }
  end
  movies = movies.select do |movie_hash|
    movie_hash[:year].to_i < max_year
  end
  movies = movies.sort_by { |movie| movie[:earnings].to_i }
  movies.last(number).reverse!
end

puts most_successful(3, 1975, filepath)
