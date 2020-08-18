def get_grade(num1, num2, num3)
  avg = (num1 + num2 + num3)/3.0
  case
  when 90 <= avg && avg <= 100
    'A'
  when 80 <= avg && avg < 90
    'B'
  when 70 <= avg && avg < 80
    'C'
  when 60 <= avg && avg < 70
    'D'
  when 0 <= avg && avg < 60
    'F'
  end
end


puts get_grade(95, 90, 93) == "A"
puts get_grade(50, 50, 95) == "D"
