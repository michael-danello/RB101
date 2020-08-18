def balanced?(string)
  return true if string[/[()]/] ==  nil  
  string.count(")") == string.count("(") && string.reverse.index(")") < string.reverse.index("(")
end

puts balanced?('What is) this?') == false
puts balanced?('What (is this?') == false
puts balanced?('((What) (is this))?') == true
puts balanced?('((What)) (is this))?') == false
puts balanced?('Hey!') == true
puts balanced?(')Hey!(') == false
puts balanced?('What ((is))) up(') == false
