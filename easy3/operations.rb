puts "Enter Number 1"
num1 = gets.chomp.to_i
puts "Enter Number 2"
num2 =  gets.chomp.to_i

add = num1+num2
subtract = num1-num2
multiply = num1*num2
divide = num1/num2
expo = num1**num2

puts "#{num1}+#{num2} = #{add}"
puts "#{num1}-#{num2} = #{subtract}"
puts "#{num1}*#{num2} = #{multiply}"
puts "#{num1}/#{num2} = #{divide}"
puts "#{num1}**#{num2} = #{expo}"
