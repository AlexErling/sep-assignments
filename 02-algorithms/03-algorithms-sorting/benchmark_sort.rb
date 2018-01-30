require_relative 'bucket_sort'
require_relative 'heap_sort'
require_relative 'quick_sort'
require_relative 'insertion_sort'
require_relative 'merge_sort'
require_relative 'bubble_sort'
require_relative 'selection_sort'
require 'benchmark'

test_array = (1..50).to_a.shuffle!
test_array_1 = test_array
test_array_2 = test_array
test_array_3 = test_array
test_array_4 = test_array
test_array_5 = test_array
test_array_6 = test_array
test_array_7 = test_array

Benchmark.bm(20) do |x|
  x.report("bucket sort") do
    bucket_sort(test_array_1)
  end
   x.report("heap sort") do
     heap_sort(test_array_2)
   end
   x.report("quick sort") do
     quick_sort(test_array_3)
   end
   x.report("insertion sort") do
     insertion_sort(test_array_4)
   end
   x.report("bubble sort") do
     bubble_sort(test_array_5)
   end
   x.report("selection sort") do
     selection_sort(test_array_6)
   end
   x.report("merge sort") do
     merge_sort(test_array_7)
   end
 end
