def center_of(string)
  middle = string.size/2
  if string.size.odd?
    string[middle]
  else
    string[middle-1..middle]
  end
end


puts center_of('I love ruby') == 'e'
puts center_of('Launch School') == ' '
puts center_of('Launch') == 'un'
puts center_of('Launchschool') == 'hs'
puts center_of('x') == 'x'
