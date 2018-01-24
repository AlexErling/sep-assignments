def fib(n)
  if n == 0
    return 0
  else
    fib_0 = 0
    fib_1 = 1
    (1..n-1).each do
      temp = fib_0
      fib_0 = fib_1
      fib_1 = fib_0 + temp
    end
    return fib_1
  end
end

puts "Fibonnaci Iterative 0-10"
(0..10).each do |n|
  puts fib(n)
end
