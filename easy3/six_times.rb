counter = 1
arr = []
while counter <= 6
   puts "Please enter number #{counter}"
   num = gets.chomp.to_i
   if counter == 6
     puts (arr.include?(num) ? "#{num} is in array" : "#{num} is not in array")
     break
   else
     arr << num
     counter += 1
   end
end
