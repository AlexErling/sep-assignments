require 'benchmark'

def r_binary_search(collection, value)
  low = 0
  high = collection.length
  mid = (high / 2).ceil
  if low >= high
    return "Value not found"
  end
  if collection[mid] == value
    return collection[mid]
  elsif collection[mid] < value
    r_binary_search(collection[(mid+1)...high], value)
  else
    r_binary_search(collection[low...mid], value)
  end
end
