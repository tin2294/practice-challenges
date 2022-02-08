class ListNode
    attr_accessor :val, :next
    def initialize(val = 0, _next = nil)
        @val = val
        @next = _next
    end
end

def merge_two_lists(list1, list2)
  final = []
  l1 = list1
  l2 = list2
  while l1 != nil
    final << l1.val
    l1 = l1.next
  end
  while l2 != nil
    final << l2.val
    l2 = l2.next
  end
  final.sort
end

list1 = ListNode.new(2)
list2 = ListNode.new(1,ListNode.new(2))
p list1
p list2
p merge_two_lists(list1,list2)
