class Node
  attr_accessor :next
  attr_accessor :prev
  attr_accessor :data

  def initialize(data)
    self.data = data
  end
end
