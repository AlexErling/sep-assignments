require 'benchmark'
require_relative 'node'
require_relative 'linked_list'

array = []
list = LinkedList.new

Benchmark.bmbm do |x|
  x.report("Add 10,000 items to array"){
    array = []
    (0...10000).each do |x|
      array[x] = Node.new(x)
    end
  }
  x.report("Append 10,000 items in list"){
    (0...10000).each do |x|
      list.add_to_tail(Node.new(x))
    end
  }
  x.report("Access 5,000th item in array"){
    list.find_node(4999)
  }
  x.report("Access 5,000th item in list"){
    array.delete_at(4999)
  }
  x.report("Delete 5,000th item in array"){
    array.delete_at(4999)
  }

  x.report("Delete 5,000th item in list"){
    list.delete(list.find_node(4999))
  }
end
