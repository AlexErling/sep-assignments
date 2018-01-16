class HashClass
  require_relative 'hash_item'

  def initialize(size)
    @items = Array.new(size)
    @size = size
  end

  def []=(key, value)
    hashed_item = @items[index(key, @size)]
    if hashed_item.nil?
      @items[index(key, @size)] = HashItem.new(key, value)
    elsif hashed_item.key != key
      while @items[index(key, @size)].key != nil && @items[index(key, @size)].key != key
        resize
        re_index = index(key, @size)
        break if @items[re_index] == nil
      end
      self[key] = value
    elsif hashed_item.key == key && hashed_item.value != value
      resize
      hashed_item.value = value
    end
  end

  def [](key)
    item = @items[index(key, @size)]
    item.nil? ? nil : item.value
  end

  def resize
    @size = @size * 2
    expanded_hash = Array.new(@size)
    @items.each do |item|
      if item != nil
        expanded_hash[index(item.key, @size)] = item
      end
    end
    @items = expanded_hash
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Simple method to return the number of items in the hash
  def size
    @size
  end

end
