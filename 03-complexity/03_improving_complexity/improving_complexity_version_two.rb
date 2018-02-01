def better_written_ruby(*arrays)
  combined_array = [arrays.map { |array| array }].flatten!
  return quick_sort(combined_array)
end

def quick_sort(array)
  if array.length <= 1
    return array
  else
    pivot = array.last
    lower = []
    higher =[]
    array.pop
    array.each do |x|
      x <= pivot ? lower.push(x) : higher.push(x)
    end
    return quick_sort(lower) + [pivot] + quick_sort(higher)
  end
end
