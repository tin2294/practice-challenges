# Assignment:
# return [total_big, total_small]
# 1 big = 4 tomato, 1 cheese
# 1 small = 2 tomato, 1 cheese

# Assumptions:
# tomato has to be greater than cheese slices

def making_sandwiches(tomato, cheese)
  # Initializing the array that will be returned in the end. Empty by default
  result = []
  # Since either kind of sandwich has only 1 slice of cheese, I made the assumption
  # that we will always need a higher amount of tomatoes than cheese because the ratio
  # of tomatoes:cheese is higher than 1.
  if tomato > cheese
    total_sandwiches = cheese
    # Since we want a 0 remainder in total, our total number of sandwiches should
    # equal the amount of cheese slices so we iterate through 1 sandwich until the
    # total amount and calculating the tomatoes used if we made all big sandwiches
    # and then on to all minus one big sandwiches until we reach a 0-remainder for
    # tomatoes. If never reached, the result is the default empty array
    (0..total_sandwiches).each do |count|
      big_tomatoes = count * 4
      small_tomatoes = (total_sandwiches - count) * 2
      result = [count, (total_sandwiches - count)] if (tomato - (big_tomatoes + small_tomatoes)).zero?
    end
  end
  result
end

tomato_slices = 16
cheese_slices = 7

p making_sandwiches(tomato_slices, cheese_slices)
