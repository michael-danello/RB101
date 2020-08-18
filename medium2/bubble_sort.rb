def bubble_sort!(arr)
  while true do
    sorted = true
    arr[0..-2].each_with_index do |el, idx|
      if el > arr[idx+1]
        arr[idx], arr[idx+1] = arr[idx+1], arr[idx]
        sorted = false
      end
    end
    break if sorted
  end
  arr
end

array = [5, 3]
p bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
p bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
p bubble_sort!(array)
array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
