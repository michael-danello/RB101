# return digits in a number as a list
def digits(num)
  num.to_s.chars.map {|char| char.to_i}
end


p digits(1234) #=> [1,2,3,4]
p digits(623) #=> [6,2,3]
p digits(7) #=> 7
