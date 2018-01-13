class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

# DEF PUSH(element)
#   INCREMENT the stack position index by 1
#   ASSIGN element to the location at the stack position index
# END DEF

  def push(item)
    @stack.unshift(item)
    self.top = @stack[0]
  end

# DEF POP
#   ASSIGN the element at the stack position index to temp
#   DECREMENT the stack position index by 1
#   RETURN temp
# END DEF

  def pop
    self.top = @stack[1]
    @stack.shift
  end

  def empty?
    @stack.length == 0
  end
end
