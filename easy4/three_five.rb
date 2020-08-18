def multisum(num)
   three_arr = (0..num).step(3).to_a
   five_arr =  (0..num).step(5).to_a
   (three_arr + five_arr).uniq.reduce(:+)
end

puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168
