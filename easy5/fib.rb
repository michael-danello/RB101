def find_fibonacci_index_by_length(num)
  #generate fib array
  fib_arr = [1,1]
  while Math.log(fib_arr[-1], 10) < num - 1
    fib_arr << fib_arr[-1] + fib_arr[-2]
  end
  fib_arr
end



find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
find_fibonacci_index_by_length(10) == 45
find_fibonacci_index_by_length(100) == 476
find_fibonacci_index_by_length(1000) == 4782
find_fibonacci_index_by_length(10000) == 47847
