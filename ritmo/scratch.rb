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
