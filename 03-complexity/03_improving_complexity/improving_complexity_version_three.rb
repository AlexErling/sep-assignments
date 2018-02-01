def best_written_ruby (*arrays)
    return arrays.map { |array| array }.flatten!.sort!
end
