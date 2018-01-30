require_relative 'insertion_sort'

def bucket_sort(array, bucket_size = 5)
  if array.length <= 1
    return array
  end

  min_value = array.min
  max_value = array.max
  bucket_count = ((max_value - min_value) / bucket_size).ceil + 1
  buckets = Array.new(bucket_count)
  (0..buckets.length - 1).each do |i|
    buckets[i] = []
  end

  (0..array.length - 1).each do |i|
    buckets[((array[i] - min_value) / bucket_size).floor].push(array[i])
  end

  array = []
  (0..buckets.length - 1).each do |i|
    buckets[i] = insertion_sort(buckets[i])
    buckets[i].each do |value|
      array.push(value)
    end
  end

  return array
end

# https://www.youtube.com/watch?v=VuXbEb5ywrU
# https://en.wikipedia.org/wiki/Bucket_sort
# https://www.geeksforgeeks.org/bucket-sort-2/
