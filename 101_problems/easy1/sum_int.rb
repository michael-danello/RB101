def sum_arr(num)
  num.to_s.chars.map(&:to_i).reduce(:+)
end

puts sum_arr(23) == 5
puts sum_arr(496) == 19
puts sum_arr(123_456_789) == 45
