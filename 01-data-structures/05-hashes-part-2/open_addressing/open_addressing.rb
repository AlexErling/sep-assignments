require_relative 'node'

class OpenAddressing
  def initialize(size)
    @hash = Array.new(size)
    @size = size
  end

  def []=(key, value)
    i =  index(key, @size)
    k = @hash[i]
    #new hash
    if @hash[i].nil?
      @hash[i] = Node.new(key, value)
    # duplicate hash pair
    elsif k.key != key
      while @hash[i].key != nil && @hash[i].key != key
        resize
        re_index = i
        break if @hash[re_index] == nil
      end
      self[key] = value
    elsif k.key == key && k.value != value
      if next_open_index(i) == -1
        resize
        re_index = index(key, @size)
        @hash[re_index].value = value
      else
        new_index = next_open_index(index(key, @size))
        @hash[new_index] = value
      end
    end
  end

  def [](key)
    hash = @hash[index(key, @size)]
    hash.nil? ? nil : hash.value
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    initial_index = index
    while index <= (@size - 1)
      if @hash[index] == nil
        return index
      elsif @hash[index] != nil && index == (initial_index - 1)
        return -1
      elsif @hash[index] != nil && @hash[index] == (@size - 1)
        index = 0
      else index += 1
      end
    end
    -1
  end

  # Simple method to return the number of items in the hash
  def size
    @size
  end

  # Resize the hash
  def resize
    @size = @size * 2
    doubled_hash = Array.new(@size)
    @hash.each do |hash|
      if hash != nil
        doubled_hash[index(hash.key, @size)] = hash
      end
    end
    @hash = doubled_hash
  end
end
