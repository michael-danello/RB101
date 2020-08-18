def merge(arr1, arr2)
  a1_counter = 0
  a2_counter = 0
  sorted_merge = []
  while a1_counter < arr1.size && a2_counter < arr2.size
    if arr1[a1_counter] <= arr2[a2_counter]
      sorted_merge << arr1[a1_counter]
      a1_counter += 1
    else
      sorted_merge << arr2[a2_counter]
      a2_counter += 1
    end
  end
  sorted_merge += arr1[a1_counter..-1] += arr2[a2_counter..-1]
end

def merge_sort(arr)
  middle = arr.size/2
  right = arr[0..middle-1]
  left = arr[middle..-1]
  if arr.size == 1
    return arr
  elsif left.size == 1 && right.size == 1
    return merge(left, right)
  else
    merge(merge_sort(left), merge_sort(right))
  end
end

p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]
