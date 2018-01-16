require_relative 'linked_list'
require_relative 'node'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @max_load_factor = 0.7
    @hash_count = 0
    @hash = Array.new(size)
  end

  def []=(key, value)
    i = index(key, @hash.size)
    n = Node.new(key, value)
    #if collision ocurs
    @hash[i] != nil ? list = @hash[i] : list = LinkedList.new
    list.add_to_tail(n)
    @hash[i] = list
    @hash_count = @hash_count + 1

    if load_factor.to_f > max_load_factor.to_f
      resize
    end
  end

  def [](key)
    list = @hash.at(index(key, @hash.size))
    if list != nil
      curr = list.head
      while curr != nil
        if curr.key == key
          return curr.value
        end
        curr = curr.next
      end
    end
  end


  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Calculate the current load factor
  def load_factor
    @hash_count / self.size.to_f
  end

  # Simple method to return the number of items in the hash
  def size
    @hash.size
  end

  # Resize the hash
  def resize
    double_size = size * 2
    new_hash = Array.new(double_size)
    (0..@hash.size - 1).each do |i|
      list = @hash[i]
      if list != nil
        curr = list.head
        new_index = index(curr.key, new_hash.size)
        while curr != nil
          list = LinkedList.new
          list.add_to_tail(curr)
          new_hash[new_index] = list
          curr = curr.next
        end
      end
    end
    @hash = new_hash
  end

  def print_hash
    loadFactor = (@hash.compact.length / self.size.to_f)
    puts "Load Factor: #{loadFactor.round(2)}"
    @hash.compact.each_with_index do |hash, index|
      puts "Index: #{index}, Value: #{hash.inspect}"
    end
  end
end
