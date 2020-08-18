def merge(arr1, arr2)
  (arr1 + arr2).uniq
end

puts merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]


#rray#|. This is a method that gives the set union of two arrays, so the result contains no duplicates.
