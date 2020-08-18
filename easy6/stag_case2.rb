def staggered_case(string)
  cap = false
  string.chars.map do |char|
    if char =~ /[A-z]/
      cap = !cap
      cap ? char.upcase : char.downcase
    else
      char
    end
  end.join
end

puts staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
puts staggered_case('ALL CAPS') == 'AlL cApS'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
