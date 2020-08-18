def yell_greet
  puts "Hi what is your name?"
  name = gets.chomp
  if name[-1] == '!'
    puts "HI #{name.chop.upcase} NICE TO MEET YOU"
  else
    puts "It eez what is ezz #{name}"
  end
end

yell_greet
