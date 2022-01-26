def minimumBribes(q)
    # Write your code here
  bribes = []
  q.each_with_index do |person, index|
    if q.last != person
      # person has to be 1 or 2 greater than the next person in line
      if ((person - q[index + 1]) == 1)
        bribes << 1
      elsif ((person - q[index + 1]) == 2)
        bribes << 2
      elsif ((person - q[index + 1]) == -1)
        bribes << 0
      elsif ((person - q[index + 1]) > 2)
        bribes << (person - q[index + 1])
        puts "Too chaotic"
      end
    end
  end
  puts bribes.sum
end

q = [4,1,2,3]

minimumBribes(q)
