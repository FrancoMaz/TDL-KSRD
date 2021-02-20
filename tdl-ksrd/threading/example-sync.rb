require "./example-helper"
require "benchmark"

puts Benchmark.measure{
  100.times do |i|
    FibHelper.fib(30)
  end
}

# 8.483785   0.004431   8.488216 (8.489941)