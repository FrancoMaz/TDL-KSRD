require "./example-helper"
require "benchmark"

puts Benchmark.measure{
  100.times do |i|
    fork do
      FibHelper.fib(30)
    end
  end
  Process.waitall
}

# 0.001575   0.038673  16.672621 (4.266092)