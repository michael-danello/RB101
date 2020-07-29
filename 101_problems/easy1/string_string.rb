# generate string of 0s and 1s based on input int
def string_string(num)
  counter = 0
  b_string = ''
  while counter < num
    counter.odd? ? b_string << '0' : b_string << '1'
    counter += 1
  end
  b_string
end

puts string_string(6) == '101010'
puts string_string(9) == '101010101'
puts string_string(4) == '1010'
puts string_string(7) == '1010101'
