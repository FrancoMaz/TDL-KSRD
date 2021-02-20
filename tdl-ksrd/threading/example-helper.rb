class FibHelper
  def self.fib(n)
    n < 2 ? n : fib(n-1) + fib(n-2)
  end
end