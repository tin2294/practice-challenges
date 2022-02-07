# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val = 0, _next = nil)
        @val = val
        @next = _next
    end
end
# @param {ListNode} head
# @return {ListNode}

def swap_pairs(head)
  dummy = ListNode.new(nil)
  dummy.next = head
  prev = dummy
  while !head.nil? && !head.next.nil?
    nxt = head.next
    head.next = nxt.next
    nxt.next = head
    prev.next = nxt
    prev = head
    head = head.next
  end
  return dummy.next
end

head = ListNode.new(1, ListNode.new(2, ListNode.new(3, ListNode.new(4))))

p swap_pairs(head)

# def swap_pairs(head)
#   head_final = []
#   indices = []
#   head.each do |number|
#     index = head.index(number)
#     if index < (head.length - 1)
#       if indices.include?(index)
#       else
#         indices << index
#         indices << index + 1
#         head_final << head[index + 1]
#         head_final << number
#       end
#     elsif (head.length % 2) != 0
#       head_final << head.last
#     end
#   end
#   head_final
# end

# head = [1,2,3,4]

# p swap_pairs(head)



# buena
    # return [] if head.nil?
    # return head if head.next.nil?

    # first = head
    # second = head.next
    # p first.val.to_s + " " + second.val.to_s
    # third = head.next.next
    # p third

    # head = second
    # head.next = first
    # head.next.next = third
    # head.next.next = swap_pairs(head.next.next) unless head.next.next.nil?

    # return head
