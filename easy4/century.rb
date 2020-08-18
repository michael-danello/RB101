def century(num)
  cent_num = get_cent_num(num)
  cent_name = get_cent_name(cent_num)
  cent_name
end

def get_cent_num(num)
  if num % 100 == 0
    num / 100
  else
    num /100 + 1
  end
end

def get_cent_name(num)
    if num.to_s[-2] == '1'
      "#{num}th"
    else
      ones_digit = num.to_s[-1].to_i
      case ones_digit
      when 1
        "#{num}st"
      when 2
        "#{num}nd"
      when 3
        "#{num}rd"
      else
        "#{num}th"
      end
    end
end

puts century(2000) == '20th'
puts century(2001) == '21st'
puts century(1965) == '20th'
puts century(256) == '3rd'
puts century(5) == '1st'
puts century(10103) == '102nd'
puts century(1052) == '11th'
puts century(1127) == '12th'
puts century(11201) == '113th'
