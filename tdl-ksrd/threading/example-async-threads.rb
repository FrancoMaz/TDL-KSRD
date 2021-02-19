require "./example-helper"
require "benchmark"

threads = []

puts Benchmark.measure{
  100.times do |i|
    threads << Thread.new do
      FibHelper.fib(30)
    end
  end
  threads.map(&:join)
}

#  8.550670   0.052296   8.602966 (8.544005)