def staggered_case(string)
  chars_arr = string.chars
  chars_arr.each_with_index.map do |char, idx|
    idx.even? ? char.upcase : char.downcase
  end.join
end


puts staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
puts staggered_case('ALL_CAPS') == 'AlL_CaPs'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
