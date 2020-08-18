def retire
  puts "How old are you?"
  age = gets.chomp.to_i
  puts "When would you like to retire?"
  retire_age = gets.chomp.to_i
  years_to_go = retire_age - age
  puts "It is now 2020. In order to retire at age #{retire_age}, you will have to work until #{Time.now.year+years_to_go}"
end

retire
