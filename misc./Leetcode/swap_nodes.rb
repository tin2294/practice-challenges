def swap_pairs(head)
  head_final = []
  indices = []
  head.each do |number|
    index = head.index(number)
    if index < (head.length - 1)
      if indices.include?(index)
      else
        indices << index
        indices << index + 1
        head_final << head[index + 1]
        head_final << number
      end
    elsif (head.length % 2) != 0
      head_final << head.last
    end
  end
  head_final
end

head = [1,2,3,4]

p swap_pairs(head)

# linked lists?
