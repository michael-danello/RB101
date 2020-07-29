# return true if number is odd
def odd?(number)
  number % 2 == 1
end

puts odd?(5) #=> True
puts odd?(0) #=> False
puts odd?(-3) #=> True
puts odd?(-4) #=> False
