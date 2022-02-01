# This method makes the hash returned by the final methods print the information
# the way it is shown in the assignment
def pretty_debt_status(hash)
  hash.each do |key, value|
    puts "#{key} - Debt: #{value[0]}, Pending confirmation: #{value[1]}"
  end
end

# This method creates a hash of arrays with they key being the iteration and the
# value/s being an array of arrays containing the debt at the moment of the iteration
# and the required debt added in the iteration. This method adds an array per iteration
# of the hash per iteration in the input. Therefore, if there is overlapping between two
# required debts, we will have an array per each of those debts.
def debt_status(total_debt, iterations)
  it_debt = total_debt
  pending_confirmation = 0
  hash_iterations = {}
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
  end
  # The following method takes the hash with all the overlapping situations and
  # cleans it to return a single array per each iteration and adds iterations in
  # case they are not covered by the required debt. i.e. months 1 and 2
  prune_hash(hash_iterations, total_debt)
end

# In this method, we take the amount of iterations needed in order to get to
# a 0 debt status, which we can get by getting the last key of the hash from the
# main method (debt_status). We now create a final hash that goes from 1 until the
# last element until a 0 debt, including the status at each iteration.
def prune_hash(hash, total_debt)
  final_hash = {}
  (1..(hash.keys.last)).each do |i|
    if hash.keys.include?(i)
      # If there is an iteration with debt with only 1 array, we can just add it
      # to our final hash since no modifications need to be made
      if hash[i].length == 1
        final_hash[i] = hash[i][0]
        # For overlapping situations (multiple arrays): the debt equals the sum of
        # the debts from all the arrays in the array because it is the outstanding
        # required debt in all the iterations running at the time. However, the balance
        # of total debt is assumed to be the debt value of the first iteration as it
        # is the most updated one
      else
        pending = hash[i].sum(&:last)
        final_hash[i] = [hash[i].flatten.first, pending]
      end
    else
      # The amount of accrued pending confirmation or required debt, is set as 0 because
      # if we get to an iteration that is not included in the hash used as input for
      # this method, it is safe to assume that there is no required debt in this iteration.
      pending_confirmation = 0
      # For the iterations with no required debt, if there were no iterations that
      # modified the total debt before this one, we can set it as the total debt from
      # the input of the assignment.
      # If there is a modified total debt, we will be taking the balance
      # from the previous iteration as we do not expect any modifications in the
      # current iteration since there is no required debt outstanding.
      total_debt = final_hash[i - 1][0] if final_hash[i - 1]
      final_hash[i] = [total_debt, pending_confirmation]
    end
  end
  # This is the final hash with all the debt and pending confirmations at each
  # iteration
  final_hash
end

# test 1
total_debt1 = 317
debt1 = {
  3 => 30,
  6 => 50,
  7 => 20,
  13 => 100,
  15 => 10.5,
  16 => 62,
  17 => 44.5
}

pretty_debt_status(debt_status(total_debt1, debt1))

puts '---------------------------------------------'

# test 2
total_debt2 = 100
debt2 = {
  3 => 30,
  6 => 50,
  7 => 20
}

pretty_debt_status(debt_status(total_debt2, debt2))
