#adding code optimizations
def well_written_ruby(*arrays)
  combined_array = arrays.map { |array| array }
  combined_array.flatten!

  sorted_array = [combined_array.pop]

  for val in combined_array
    i = 0
    while i < sorted_array.length
      if val <= sorted_array[i]
        sorted_array.insert(i, val)
        break
      elsif i == sorted_array.length - 1
        sorted_array << val
        break
      end
      i+=1
    end
  end
  sorted_array
end
