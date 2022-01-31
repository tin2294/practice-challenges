tomato_slices = 16
cheese_slices = 7

# return [total_big, total_small]

# 1 big = 4 tomato, 1 cheese
# 1 small = 2 tomato, 1 cheese

# tomato has to be greater than cheese slices

def making_sandwiches(tomato, cheese)
  result = []
  if tomato > cheese
    total_sandwiches = cheese
    (1..total_sandwiches).each do |count|
      big_tomatoes = count * 4
      small_tomatoes = (total_sandwiches - count) * 2
      result = [count, (total_sandwiches - count)] if (tomato - (big_tomatoes + small_tomatoes)) == 0
    end
  end
  return result
end

p making_sandwiches(tomato_slices, cheese_slices)
