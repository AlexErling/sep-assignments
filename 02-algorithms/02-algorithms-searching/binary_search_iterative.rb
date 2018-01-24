require 'benchmark'
require_relative "binary_search_recursive"

def i_binary_search(collection, value)
  low = 0
  high = collection.length - 1

  while low <= high
    mid = (low + high) / 2
    if collection[mid] > value
      high = mid - 1
    elsif collection[mid] < value
      low = mid + 1
    else
      return collection[mid]
    end
  end
  return "Value not found"
end

arr = []
(0..999999).each do |x|
  arr.push(x)
end

puts "Testing Iterative vs Recursive Binary Searches"
puts "Searching for 500,000."
Benchmark.bm do |x|
    x.report("Iterative search for 500000 in sorted array.") do
      i_binary_search(arr, 500000)
    end
    x.report("Recursive search for 500000 in sorted array.") do
      r_binary_search(arr, 500000)
    end
end

puts "Searching for 999,999."
Benchmark.bm do |x|
    x.report("Iterative search for 999999 in sorted array.") do
      i_binary_search(arr, 999999)
    end
    x.report("Recursive search for 999999 in sorted array.") do
      r_binary_search(arr, 999999)
    end
end

puts "Searching for 1000."
Benchmark.bm do |x|
    x.report("Iterative search for 1000 in sorted array.") do
      i_binary_search(arr, 1000)
    end
    x.report("Recursive search for 1000 in sorted array.") do
      r_binary_search(arr, 1000)
    end
end
