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
    results << example_pool.future.compute(30)
  end
  results.map(&:value)
}