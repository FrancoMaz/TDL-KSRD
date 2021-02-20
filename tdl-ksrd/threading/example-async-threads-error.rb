require "./example-helper"
require 'thread'

threads = []

10_000.times do |i|
  threads << Thread.new do
    puts "Your thread limit is #{i} threads"
    FibHelper.fib(30)
  end
end

threads.map(&:join)

# Your thread limit is 7891 threads
# Terminado (killed)