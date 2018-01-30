def find_worst_case_scenario(n)
  y = 1
  until y > n do
  puts "The worst case scenario for #{y} in a linear search is #{y}."
  y += 1
  end
end

puts find_worst_case_scenario(10)
