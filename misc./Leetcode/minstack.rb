class MinStack
  def initialize(val=[])
    @val = val
  end


=begin
  :type val: Integer
  :rtype: Void
=end
  def push(val)
    @val << val
  end


=begin
  :rtype: Void
=end
  def pop()
    @val.pop
  end


=begin
  :rtype: Integer
=end
  def top()
    @val.last
  end


=begin
  :rtype: Integer
=end
  def get_min()
    @val.min
  end


end

minStack = MinStack.new();
p minStack
p minStack.push(-2)
p minStack.push(-1)
p minStack.pop()
p minStack.top
p minStack.get_min
