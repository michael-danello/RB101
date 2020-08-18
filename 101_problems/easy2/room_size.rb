M2_2_F2 = 10.7639

def room_size()
  puts 'How wide is the room?'
  width = gets.chomp.to_i
  puts 'How long is the room?'
  length = gets.chomp.to_i
  area = width * length
  area_ft = area * M2_2_F2
  puts "The area of the room is #{area} meters (#{area_ft} feet)"
end

room_size
