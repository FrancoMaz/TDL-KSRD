require "./example-helper"
require "benchmark"
require 'celluloid/autostart'
require 'celluloid/pool'

class ExampleWorker
  include Celluloid

  def compute(n)
    FibHelper.fib(n)
  end
end

results = []

puts Benchmark.measure {
  example_pool = ExampleWorker.pool(size: 10)
  10_000.times do |i|
    puts "Computing async: #{i} "
    results << example_pool.async.compute(30)
  end
  results.map(&:value)
}

# 887.658043   1.052814 888.710857 (890.827077)