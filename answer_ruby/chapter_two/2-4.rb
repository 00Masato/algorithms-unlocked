require 'benchmark'

# n: integer(type: int, n >= 0)
def factorial(n)
  return 1 if n == 0
  n * factorial(n-1)
end

# def bad_factorial(n)
#   return 1 if n == 0
#   bad_factorial(n+1) / (n+1)
# rescue SystemStackError => e
#   p 'SystemStackError'
# end

Benchmark.bm 10 do |r|
  r.report 'factorial' do
    p factorial(5)
  end
end

# p bad_factorial(5)