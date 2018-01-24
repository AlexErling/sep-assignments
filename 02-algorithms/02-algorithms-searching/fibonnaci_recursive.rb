require 'benchmark'

def fib_recursive(n)
  n < 2 ? (return n) : (fib_recursive( n - 1 ) + fib_recursive(n - 2 ))
end

def fib_iterative(n)
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

puts "Benchmark test to find 30th number in Fibonacci sequence."
Benchmark.bm do |x|
  x.report("recursive") do
    fib_recursive(30)
  end
  x.report("iterative") do
    fib_iterative(30)
  end
end
