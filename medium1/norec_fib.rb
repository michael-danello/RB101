def fibonacci(nth)
  n1 = 1
  n2 = 1
  3.upto(nth) do |_|
    n2 = n2 % 10
    n1 = n1 % 10
    sum = n2 + n1
    n2, n1 = sum, n2
  end
  n2
end

# fibonacci(20) #== 6765
# fibonacci(100) #== 354224848179261915075
# fibonacci(100_001) # => 4202692702.....8285979669707537501

def fibonacci_last(nth)
  fibonacci(nth).to_s[-1].to_i
end


puts fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
# puts fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
# puts fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
# puts fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
# puts fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
# puts fibonacci_last(123456789) # -> 4
