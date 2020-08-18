def interleave(arr1, arr2)
  combined_arr = []
  arr1.each_with_index do |el, idx|
    # can combine into one line
    combined_arr << el
    combined_arr << arr2[idx]
  end
  combined_arr
end


puts interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
