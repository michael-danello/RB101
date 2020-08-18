def sum_product
  puts "Please enter a number greater than 0"
  num = gets.chomp.to_i
  puts "Would you like to calculate Product (p) or Sum (s)"
  s_p = gets.chomp
  puts s_p == 's' ? (1..num).to_a.reduce(:+) : (1..num).to_a.reduce(:*)
end

sum_product
