total_debt = 317
debt = {
  3=> 30,
  6=> 50,
  7=> 20,
  13=> 100,
  15=> 10.5,
  16=> 62,
  17=> 44.5
}

def pretty_debt_status(hash)
  hash.each do |key, value|
    puts "#{key} - Debt: #{value[0]}, Pending confirmation: #{value[1]}"
  end
end

# def debt_status(total_debt, iterations)
#   pending_confirmation = 0
#   hash_iterations = Hash.new
#   iterations.each do |key, value|
#     ((key-2)..key).each do |i|
#       if i == key
#         total_debt -= pending_confirmation
#         pending_confirmation += (value - pending_confirmation)
#       end
#       if hash_iterations.keys.include?(i)
#         # hash_iterations[i] << [total_debt, pending_confirmation]
#         # hash_iterations[i][0] = total_debt
#         # hash_iterations[i][1] = pending_confirmation
#       else
#         hash_iterations[i] = [total_debt, pending_confirmation]
#       end
#       p i
#       p hash_iterations[i]
#     end
#   end
#   return hash_iterations
# end


# def debt_status(total_debt, iterations)
#   pending_confirmation = 0
#   hash_iterations = {}
#   iterations.each do |key, value|
#     ((key-2)..key).each do |i|
#       if i == key
#         total_debt -= pending_confirmation
#         pending_confirmation += (value - pending_confirmation)
#       end
#       puts "#{key}, #{i} - Debt: #{total_debt}, Pending confirmation: #{pending_confirmation}" if total_debt >= 0
#     end
#   end
# end


# def debt_status(total_debt, iterations)
#   it_debt = total_debt
#   pending_confirmation = 0
#   hash_iterations = Hash.new()
#   (1..(iterations.keys.last + 6)).each do |i|
#     hash_iterations[i] = [total_debt, pending_confirmation]
#   end
#   iterations.each do |key, value|
#     amortization = value
#     (1..(iterations.keys.last + 6)).each do |i|
#       if (key..(key + 3)).include?(i)
#         if i == (key + 3)
#           amortization = 0
#           p value
#           p it_debt
#           it_debt -= value
#           p it_debt
#           hash_iterations[i][0] = it_debt
#         end
#         hash_iterations[i][1] += amortization
#         hash_iterations[i][0] = it_debt
#         # it_debt = hash_iterations[i][0]
#       else
#         hash_iterations[i][0] = it_debt
#       end
#     end
#   end
#   return hash_iterations
# end

def debt_status(total_debt, iterations)
  it_debt = total_debt
  pending_confirmation = 0
  hash_iterations = Hash.new()
  iterations.each do |iteration, value|
    (iteration..(iteration + 3)).each do |i|
      pending_confirmation += value if iteration == i
      it_debt -= value if i == (iteration + 3)
      pending_confirmation = 0 if i == (iteration + 3)
      if hash_iterations.keys.include?(i)
        hash_iterations[i] << [it_debt, pending_confirmation]
      else
        hash_iterations[i] = [[it_debt, pending_confirmation]]
      end
    end
    pending_confirmation = 0
    # it_debt = total_debt
  end
  prune_hash(hash_iterations, total_debt)
end

def prune_hash(hash, total_debt)
  final_hash = {}
  (1..(hash.keys.last)).each do |i|
    if hash.keys.include?(i)
      if hash[i].length == 1
        final_hash[i] = hash[i][0]
      else
        pending = hash[i].sum(&:last)
        final_hash[i] = [hash[i].flatten.first, pending]
      end
    else
      pending_confirmation = 0
      # p final_hash[i-1]
      if final_hash[i-1] != nil
        total_debt = final_hash[i - 1][0]
      end
      final_hash[i] = [total_debt, pending_confirmation]
    end
  end
  return final_hash
end

hash = debt_status(total_debt, debt)
# p hash
pretty_debt_status(hash)
