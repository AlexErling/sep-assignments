class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
  end

# DEF ENQUEUE(element)
#   Add element to the end of the list
# END DEF

  def enqueue(element)
    @queue.insert(@queue.length, element)
    @head = @queue.first
    @tail = @queue.last
  end

# DEF DEQUEUE
#   SET temp to the first element
#   Left-Shift the list by one entry
#   RETURN temp
# END DEF


  def dequeue
    if !empty?
      @queue.delete_at(@queue.length-1)
    end
    @tail = @queue.last
    @head = @queue.first
  end

  def empty?
    @queue.length == 0
  end
end
