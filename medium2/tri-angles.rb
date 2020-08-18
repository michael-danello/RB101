def triangle(angle1, angle2, angle3)
  tri_arr = [angle1, angle2, angle3]
  case
  when tri_arr.sum != 180 || tri_arr.include?(0)  then :invalid
  when tri_arr.any? {|angle| angle > 90} then :obtuse
  when tri_arr.include?(90) then :right
  else :acute
  end
end

puts triangle(60, 70, 50) == :acute
puts triangle(30, 90, 60) == :right
puts triangle(120, 50, 10) == :obtuse
puts triangle(0, 90, 90) == :invalid
puts triangle(50, 50, 50) == :invalid
