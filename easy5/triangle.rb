def triangle(num)
  counter = 0
  while counter <= num
    puts ("*"*counter).rjust(num, " ")
    counter += 1
  end
end

triangle(10)
