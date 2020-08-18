def calc_tip
  puts "What is bill?"
  bill = gets.to_f
  puts "What is tip percentage?"
  tip = gets.to_f
  puts "With bill of #{bill} and tip of #{tip}%, total tip is #{(bill*tip/100).round(2)}"
end

calc_tip
