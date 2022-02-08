class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

def hasCycle(head)
  head_new = head
  arr = []
  while !head_new.nil?
    if arr.include?(head_new.next.object_id)
      return true
    else
      arr << head_new.object_id
      head_new = head_new.next
    end
  end
  return false
end

# cooler and faster solution
# def hasCycle(head)
#   slower, faster = head, head

#   while !slower.nil? && !faster.nil? && !faster.next.nil?
#     slower = slower.next
#     faster = faster.next.next

#     return true if slower == faster
#   end

#   return false
# end


head = ListNode.new(3)
n2 = ListNode.new(2)
n3 = ListNode.new(0)
n4 = ListNode.new(-4)

head.next = n2
head.next.next = n3
head.next.next.next = n4
head.next.next.next.next = n2
p hasCycle(head)
