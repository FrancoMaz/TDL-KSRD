require "./example-helper"
require "benchmark"
require 'thread'

POOL_SIZE = 10

# Create a Queue data structure for the jobs needs to be done.
# Queue is thread-safe so if multiple threads
# access it at the same time, it will maintain consistency
jobs = Queue.new

10_000.times{|i| jobs.push 30}

puts Benchmark.measure{
# Transform an array of 10 numbers into an array of workers
  workers = (POOL_SIZE).times.map do
    Thread.new do
      begin
        while x = jobs.pop(true)
          FibHelper.fib(x)
        end
      rescue ThreadError
      end
    end
  end

  workers.map(&:join)
}

# 843.015506   0.344174 843.359680 (843.201630)