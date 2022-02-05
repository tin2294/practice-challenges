def swap_pairs(head)
    return [] if head.nil?
    return head if head.next.nil?

    first = head
    second = head.next
    p first.val.to_s + " " + second.val.to_s
    third = head.next.next
    p third

    head = second
    head.next = first
    head.next.next = third
    head.next.next = swap_pairs(head.next.next) unless head.next.next.nil?

    return head
end

head = [1,2,3,4]

p swap_pairs(head)
