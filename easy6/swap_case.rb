def swapcase(string)
  chars = string.chars
  lowercase = ("a".."z").to_a
  uppercase = ("A".."Z").to_a
  chars.map do |char|
    if lowercase.include?(char)
      char.upcase
    else uppercase.include?(char)
      char.downcase
    end
  end.join
end

puts swapcase('CamelCase') == 'cAMELcASE'
puts swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
