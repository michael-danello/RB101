

def letter_percentages(string)
  letter_count = {lowercase: 0, uppercase: 0, neither: 0}
  char_frac = 1.0/string.size*100.round(2)
  p char_frac
  string.each_char do |char|
    if char.upcase != char
      letter_count[:lowercase] += char_frac
    elsif char.downcase != char
      letter_count[:uppercase] += char_frac
    else
      letter_count[:neither] += char_frac
    end
  end
  letter_count
end

p letter_percentages('abCdef 123') #== { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') #== { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') #== { lowercase: 0, uppercase: 0, neither: 100 }
