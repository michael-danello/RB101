def negative(num)
  if num > 0
    -num
  else
    num
  end
end

#-number.abss
puts negative(5) == -5
puts negative(-3) == -3
puts negative(0) == 0      # There's no such thing as -0 in ruby
